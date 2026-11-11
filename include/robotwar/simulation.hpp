#pragma once
#include "robotwar/program.hpp"
#include "robotwar/vm.hpp"
#include "robotwar/world.hpp"
#include <functional>
#include <string>
#include <vector>

namespace robotwar {
struct RobotSnapshot {
  std::string name;
  CpuState cpu;
  WorldRobot physical;
};

struct SimulationSnapshot {
  std::uint64_t tick{};
  std::vector<RobotSnapshot> robots;
};

// Owns execution, not presentation. A GUI can observe immutable snapshots,
// source-mapped instruction traces and world events, and call step() to advance.
class Simulation {
public:
  using RandomWordSource = std::function<std::int16_t()>;
  using TraceSink = std::function<void(std::size_t, const InstructionTrace &)>;
  explicit Simulation(RandomWordSource random = {});
  std::size_t add_robot(std::string name, Program program, std::int16_t x, std::int16_t y);
  void step();
  void run(std::uint64_t ticks);
  SimulationSnapshot snapshot() const;
  void set_trace_sink(TraceSink sink);
  void set_event_sink(World::EventSink sink);
  std::size_t alive() const;
  const Program &program(std::size_t index) const;

private:
  struct Robot {
    std::string name;
    Program program;
    CpuState cpu;
  };

  World world_;
  std::vector<Robot> robots_;
  RandomWordSource random_;
  TraceSink trace_;
};
} // namespace robotwar
