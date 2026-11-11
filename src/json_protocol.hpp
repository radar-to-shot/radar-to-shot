#pragma once
#include <nlohmann/json.hpp>
#include <string>
#include <string_view>

namespace robotwar {
// Shared native/WASM protocol. The JSON layer is independent of core simulation.
nlohmann::json dispatch_json(const nlohmann::json &input);
// Parse one request and serialize a response, including recoverable exceptions.
std::string request_json(std::string_view input);
} // namespace robotwar
