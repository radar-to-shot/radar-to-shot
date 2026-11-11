#include "json_protocol.hpp"
#include <string>

// Called synchronously from one worker. The returned UTF-8 bytes remain valid
// until the next call; JavaScript cwrap/ccall copies them into a JS string.
extern "C" const char *robotwar_request(const char *request) noexcept {
  static std::string response;
  try {
    if (!request)
      response = R"({"exception":"Null request"})";
    else
      response = robotwar::request_json(request);
    return response.c_str();
  } catch (...) {
    // Even allocation failure must not propagate through the C ABI. This
    // fallback requires no allocation and has static storage duration.
    return R"({"exception":"Request failed: response allocation unavailable"})";
  }
}
