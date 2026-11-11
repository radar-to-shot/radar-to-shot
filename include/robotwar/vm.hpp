#pragma once

#include "robotwar/bytecode.hpp"
#include <array>
#include <cstdint>
#include <functional>
#include <span>

namespace robotwar {

struct CpuState {
  std::int16_t pc{};
  std::int16_t accumulator{};
  std::array<std::int16_t, 19> registers{};
  std::array<std::int16_t, 201> memory{};
  // Slot zero holds the accumulator saved by an interrupt.
  std::array<std::int16_t, 30> stack{};
  std::int16_t stack_pointer{1};
  bool interrupt_active{};
  std::int16_t cycle_debt{};
  std::uint32_t error_resets{};
  std::int16_t radar_result{}; // Separate from the stored radar angle in register 16.
  std::int16_t num_robots{1};  // Live population, including this robot.
};

struct RegisterWrite {
  std::int16_t value{};
  std::int16_t extra_cycles{};
};

// World and presentation integration never require a dependency on a GUI toolkit.
// With no bus, non-CPU registers are a raw fixture bank for isolated CPU replay.
class RegisterBus {
public:
  virtual ~RegisterBus() = default;
  virtual std::int16_t read(std::uint8_t reg, std::int16_t cached) = 0;
  virtual RegisterWrite write(std::uint8_t reg, std::int16_t value) = 0;
  virtual std::int16_t random_word();

  virtual void raw_register_write(std::uint8_t, std::int16_t) {}

  virtual void raw_radar_write(std::int16_t) {}

  virtual void reset() {}

  virtual void begin_slice(bool /*clock_tick*/) {}

  virtual void end_slice() {}
};

struct InstructionTrace {
  std::int16_t address{};
  Instruction instruction{};
  std::int16_t accumulator_before{};
  std::int16_t accumulator_after{};
  std::int16_t next_pc{};
  std::int16_t cycles{};
};

struct RunResult {
  std::int16_t cycles{};
  std::uint32_t instructions{};
  bool trace_break{};
};

class VirtualCpu {
public:
  bool trace_enabled{true};
  std::function<void(const InstructionTrace &)> observer;
  void reset(CpuState &, RegisterBus * = nullptr) const;
  RunResult run(std::span<const Instruction> program, CpuState &, std::int16_t cycle_budget,
                RegisterBus * = nullptr, bool clock_tick = false) const;
};

} // namespace robotwar
