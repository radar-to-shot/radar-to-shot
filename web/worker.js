// Each worker owns one engine instance. Terminating it cancels a synchronous
// WebAssembly battle immediately, without blocking the page's main thread.
const MAX_REQUEST_BYTES = 512 * 1024;
let callEngine;
const boot = (async () => {
  const { default: createRobotWarModule } = await import('./wasm/robotwar.js');
  const module = await createRobotWarModule({
    locateFile: (file) => new URL(`./wasm/${file}`, import.meta.url).href,
  });
  callEngine = module.cwrap('robotwar_request', 'string', ['string']);
  postMessage({ type: 'ready' });
})();
boot.catch((error) => postMessage({ type: 'error', message: error?.message || String(error) }));
self.onmessage = async ({ data }) => {
  const { id, request } = data || {};
  try {
    await boot;
    const serialized = JSON.stringify(request);
    if (new TextEncoder().encode(serialized).length > MAX_REQUEST_BYTES)
      throw new Error('Request exceeds the 512 KiB browser engine limit.');
    const output = callEngine(serialized);
    const result = JSON.parse(output);
    if (result && typeof result.exception === 'string') throw new Error(result.exception);
    postMessage({ id, result });
  } catch (error) {
    postMessage({ id, error: error?.message || String(error) });
  }
};
