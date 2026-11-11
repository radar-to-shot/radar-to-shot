#include "robotwar/simulation.hpp"
#include <algorithm>
#include <stdexcept>
#include <utility>

namespace robotwar {
namespace {
class WorldBus final : public RegisterBus {
  World &world_;
  std::size_t robot_;
  CpuState &cpu_;
  const Simulation::RandomWordSource &random_;

public:
  WorldBus(World &w, std::size_t i, CpuState &cpu, const Simulation::RandomWordSource &random)
      : world_(w), robot_(i), cpu_(cpu), random_(random) {}

  void sync() {
    auto &physical = world_.state(robot_);
    for (unsigned r = 0; r < cpu_.registers.size(); ++r) {
      if (r == 10 || r == 11 || r == 17 || r == 18)
        physical.registers[r] = cpu_.registers[r];
      else
        cpu_.registers[r] = physical.registers[r];
    }
    cpu_.radar_result = physical.radar_result;
  }

  void begin_slice(bool) override {
    sync();
  }

  void end_slice() override {
    sync();
  }

  std::int16_t read(std::uint8_t r, std::int16_t) override {
    return world_.read_register(robot_, r);
  }

  RegisterWrite write(std::uint8_t r, std::int16_t value) override {
    const auto extra = world_.write_register(robot_, r, value);
    sync();
    return {world_.state(robot_).registers[r], static_cast<std::int16_t>(extra)};
  }

  void raw_register_write(std::uint8_t r, std::int16_t value) override {
    world_.state(robot_).registers.at(r) = value;
  }

  void raw_radar_write(std::int16_t value) override {
    world_.state(robot_).radar_result = value;
  }

  std::int16_t random_word() override {
    if (!random_)
      throw std::logic_error("Program reads RANDOM: inject a RandomWordSource");
    return random_();
  }

  void reset() override {
    auto &r = world_.state(robot_);
    for (unsigned i = 0; i < r.registers.size(); ++i)
      if (i != 0 && i != 1 && i != 3 && i != 4 && i != 7 && i != 9)
        r.registers[i] = 0;
    r.registers[16] = 0;
    r.radar_result = -1;
    r.target_x = r.target_y = 0;
  }
};
} // namespace

Simulation::Simulation(RandomWordSource random) : random_(std::move(random)) {}

std::size_t Simulation::add_robot(std::string name, Program program, std::int16_t x,
                                  std::int16_t y) {
  if (program.code.empty())
    throw std::invalid_argument("Cannot simulate an empty program");
  const auto index = world_.add_robot(program.attributes, x, y);
  Robot robot{std::move(name), std::move(program), {}};
  robot.cpu.registers = world_.state(index).registers;
  robot.cpu.radar_result = world_.state(index).radar_result;
  robots_.push_back(std::move(robot));
  return index;
}

void Simulation::step() {
  world_.begin_tick();
  for (std::size_t i = 0; i < robots_.size(); ++i) {
    auto &r = robots_[i];
    if (!world_.state(i).active)
      continue;
    // The original battle loop subtracts prior cycle overshoot from this slice.
    const auto budget =
        static_cast<std::int16_t>((100 << r.program.attributes[0]) - r.cpu.cycle_debt);
    WorldBus bus(world_, i, r.cpu, random_);
    VirtualCpu cpu;
    cpu.trace_enabled = false;
    if (trace_)
      cpu.observer = [&, i](const InstructionTrace &item) { trace_(i, item); };
    cpu.run(r.program.code, r.cpu, budget, &bus, true);
    world_.end_cpu_slice(i);
  }
  world_.update_physics();
  for (std::size_t i = 0; i < robots_.size(); ++i) {
    auto &cpu = robots_[i].cpu;
    const auto &physical = world_.state(i);
    for (unsigned r = 0; r < cpu.registers.size(); ++r)
      if (r != 10 && r != 11 && r != 17 && r != 18)
        cpu.registers[r] = physical.registers[r];
  }
}

void Simulation::run(std::uint64_t ticks) {
  while (ticks--)
    step();
}

SimulationSnapshot Simulation::snapshot() const {
  SimulationSnapshot result;
  result.tick = world_.snapshot().tick;
  for (std::size_t i = 0; i < robots_.size(); ++i)
    result.robots.push_back({robots_[i].name, robots_[i].cpu, world_.state(i)});
  return result;
}

void Simulation::set_trace_sink(TraceSink sink) {
  trace_ = std::move(sink);
}

void Simulation::set_event_sink(World::EventSink sink) {
  world_.set_event_sink(std::move(sink));
}

std::size_t Simulation::alive() const {
  std::size_t count = 0;
  for (std::size_t i = 0; i < robots_.size(); ++i)
    count += world_.state(i).active;
  return count;
}

const Program &Simulation::program(std::size_t index) const {
  return robots_.at(index).program;
}
} // namespace robotwar
