#pragma once

#include <cstdint>

namespace robotwar {
// The original compiler emits exactly these four bytes, with operand big endian.
struct Instruction {
  std::uint8_t opcode{};
  std::uint8_t mode{};
  std::int16_t operand{};
  bool operator==(const Instruction &) const = default;
};
enum class Opcode : std::uint8_t {
  Nop = 0,
  Load = 1,
  Add = 2,
  Subtract = 3,
  Multiply = 4,
  Divide = 5,
  Modulo = 6,
  And = 7,
  Or = 8,
  Xor = 9,
  Equal = 10,
  Greater = 11,
  Less = 12,
  GreaterEqual = 13,
  LessEqual = 14,
  NotEqual = 15,
  Store = 16,
  Gosub = 17,
  Goto = 18,
  Return = 19,
  EndInterrupt = 20,
  Trace = 21,
  Reset = 22
};
enum class OperandType : std::uint8_t {
  Register = 1,
  Constant = 2,
  Label = 3,
  Memory = 4,
  IndirectMemory = 5
};
enum class Register : std::uint8_t {
  X = 0,
  Y = 1,
  Aim = 2,
  Shot = 3,
  Damage = 4,
  Speed = 5,
  Direction = 6,
  Fuel = 7,
  Cloak = 8,
  NumRobots = 9,
  TimeInterruptMask = 10,
  TimeInterruptTransfer = 11,
  XConversion = 12,
  YConversion = 13,
  AngleConversion = 14,
  DistanceConversion = 15,
  Radar = 16,
  Random = 17,
  Stack = 18
};
} // namespace robotwar
