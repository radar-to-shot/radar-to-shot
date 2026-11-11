#pragma once
#include "robotwar/bytecode.hpp"
#include <array>
#include <cstddef>
#include <cstdint>
#include <vector>

namespace robotwar {
struct SourceSpan {
  std::size_t offset{};
  std::size_t length{};
  std::size_t line{}; // zero based; original debugger also numbers from zero
};
struct Program {
  std::vector<Instruction> code;
  // CPU_SPEED, FIRE_RATE, ENGINE_SIZE, RADAR_RANGE, FUEL_CAPACITY, CLOAKING,
  // ARMOR
  std::array<std::int16_t, 7> attributes{};
  std::vector<SourceSpan> source_map;
  std::int16_t allocated_memory{};
};
} // namespace robotwar
