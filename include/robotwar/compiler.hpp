#pragma once
#include "robotwar/program.hpp"
#include <optional>
#include <string>
#include <string_view>

namespace robotwar {
struct Diagnostic {
  std::string message;
  SourceSpan source;
};

struct CompileResult {
  Program program;
  std::uint16_t error_position{};
  std::optional<Diagnostic> error;

  explicit operator bool() const noexcept {
    return !error;
  }
};

// Native source convention is CR. LF and CRLF are accepted as a portability
// extension.
struct ScanResult {
  std::uint8_t kind{}, operation{}, attribute{};
  std::int16_t value{};
  std::string symbol;
  std::uint16_t next_offset{};
  std::string error;
};

ScanResult scan_token(std::string_view source, std::uint16_t offset = 0, bool has_operand = false);
CompileResult compile(std::string_view source, bool debug = false);
std::vector<std::uint8_t> encode_bytecode(const Program &program);
} // namespace robotwar
