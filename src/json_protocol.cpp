#include "json_protocol.hpp"
#include "robotwar/compiler.hpp"
#include "robotwar/mac_math.hpp"
#include "robotwar/simulation.hpp"
#include "vm_json.hpp"
#include "world_json.hpp"
#include <cstdint>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace robotwar {
using nlohmann::json;

namespace {
std::string robot_source(const json &item) {
  if (item.contains("source") == item.contains("source_hex"))
    throw std::invalid_argument("Supply exactly one of source and source_hex for each robot");
  if (item.contains("source"))
    return item.at("source").get<std::string>();
  const auto hex = item.at("source_hex").get<std::string>();
  if (hex.size() % 2)
    throw std::invalid_argument("source_hex must contain an even number of hexadecimal digits");
  auto digit = [](char c) {
    if (c >= '0' && c <= '9')
      return c - '0';
    if (c >= 'a' && c <= 'f')
      return c - 'a' + 10;
    if (c >= 'A' && c <= 'F')
      return c - 'A' + 10;
    throw std::invalid_argument("source_hex contains a non-hexadecimal character");
  };
  std::string source;
  source.reserve(hex.size() / 2);
  for (std::size_t i = 0; i < hex.size(); i += 2)
    source.push_back(static_cast<char>((digit(hex[i]) << 4) | digit(hex[i + 1])));
  return source;
}

json compile_json(const json &input) {
  auto result = robotwar::compile(robot_source(input), input.value("debug", false));
  const auto bytes = robotwar::encode_bytecode(result.program);
  static constexpr char hex[] = "0123456789abcdef";
  std::string encoded;
  encoded.reserve(bytes.size() * 2);
  for (auto byte : bytes) {
    encoded += hex[byte >> 4];
    encoded += hex[byte & 15];
  }
  json attributes = json::array();
  for (auto attribute : result.program.attributes)
    attributes.push_back(static_cast<std::uint16_t>(attribute));
  return {{"error", result.error ? result.error->message : ""},
          {"error_position", result.error_position},
          {"attributes", attributes},
          {"code_count", result.program.code.size()},
          {"code_hex", encoded}};
}

json event_json(const WorldEvent &event) {
  return {{"kind", static_cast<int>(event.kind)},
          {"tick", event.tick},
          {"robot", event.robot},
          {"other", event.other},
          {"x", event.x},
          {"y", event.y},
          {"value", event.value}};
}

class BattleSession {
  mac::QuickDrawRandom random_;
  Simulation simulation_;
  bool render_, record_events_{}, include_rng_seed_{}, stop_when_finished_{}, done_{};
  std::uint64_t tick_limit_{}, elapsed_{};
  json events_ = json::array();
  std::vector<WorldEvent> view_events_;

public:
  // The RNG callback and event sink capture this stable, nonmovable owner.
  explicit BattleSession(const json &input, bool render)
      : random_(input.value("seed", 1u)), simulation_([this] { return random_(); }),
        render_(render) {
    const auto &items = input.at("robots");
    if (!items.is_array() || items.empty() || items.size() > 5)
      throw std::invalid_argument("A battle needs one to five robots");
    bool explicit_positions = true, generated_positions = true;
    for (const auto &item : items) {
      explicit_positions &= item.contains("x") && item.contains("y");
      generated_positions &= !item.contains("x") && !item.contains("y");
    }
    if (!explicit_positions && !generated_positions)
      throw std::invalid_argument("Supply x and y for every robot, or omit both for every robot");
    std::vector<robotwar::WorldPlacement> placements;
    if (generated_positions)
      placements = robotwar::World::random_placements(items.size(), [&] { return random_(); });
    std::size_t index = 0;
    for (const auto &item : input.at("robots")) {
      auto compiled = robotwar::compile(robot_source(item));
      if (!compiled)
        throw std::invalid_argument(item.value("name", std::string("robot")) + ": " +
                                    compiled.error->message);
      simulation_.add_robot(
          item.value("name", std::string("robot")), std::move(compiled.program),
          explicit_positions ? item.at("x").get<std::int16_t>() : placements[index].x,
          explicit_positions ? item.at("y").get<std::int16_t>() : placements[index].y);
      ++index;
    }
    if (input.at("robots").empty())
      throw std::invalid_argument("A battle needs at least one robot");

    record_events_ = input.value("events", false);
    include_rng_seed_ = input.value("include_rng_seed", false);
    stop_when_finished_ = input.value("stop_when_finished", false);
    tick_limit_ = input.value("ticks", 1000u);
    if (tick_limit_ > 1000000)
      throw std::invalid_argument("CLI tick limit is 1000000");
    done_ = tick_limit_ == 0;
    if (record_events_ || render_)
      simulation_.set_event_sink([this](const WorldEvent &event) {
        if (record_events_)
          events_.push_back(event_json(event));
        if (render_)
          view_events_.push_back(event);
      });
  }

  BattleSession(const BattleSession &) = delete;
  BattleSession &operator=(const BattleSession &) = delete;
  BattleSession(BattleSession &&) = delete;
  BattleSession &operator=(BattleSession &&) = delete;

  void advance(std::uint64_t count) {
    view_events_.clear();
    while (count-- && !done_) {
      simulation_.step();
      ++elapsed_;
      done_ = elapsed_ >= tick_limit_ || (stop_when_finished_ && simulation_.alive() <= 1);
    }
  }

  void run() {
    advance(tick_limit_);
  }

  json snapshot() const {
    auto snapshot = simulation_.snapshot();
    json robots = json::array();
    for (const auto &robot : snapshot.robots) {
      const auto &p = robot.physical;
      robots.push_back({{"name", robot.name},
                        {"active", p.active},
                        {"registers", p.registers},
                        {"pc", robot.cpu.pc},
                        {"accumulator", robot.cpu.accumulator},
                        {"memory", robot.cpu.memory},
                        {"stack_pointer", robot.cpu.stack_pointer},
                        {"cycle_debt", robot.cpu.cycle_debt},
                        {"error_resets", robot.cpu.error_resets},
                        {"velocity", {p.velocity_x, p.velocity_y}},
                        {"score", p.score},
                        {"raw_damage", p.raw_damage},
                        {"shell_active", p.shell.active}});
    }
    json result = {{"tick", snapshot.tick},
                   {"alive", simulation_.alive()},
                   {"robots", robots},
                   {"events", events_}};
    if (include_rng_seed_)
      result["rng_seed"] = random_.seed();

    if (render_) {
      json glyphs = json::array();
      for (const auto &robot : snapshot.robots) {
        const auto &p = robot.physical;
        const auto &shell = p.shell;
        glyphs.push_back({{"name", robot.name},
                          {"x", p.registers[0]},
                          {"y", p.registers[1]},
                          {"aim", p.registers[2]},
                          {"direction", p.registers[6]},
                          {"active", p.active},
                          {"cloak", p.registers[8] != 0},
                          {"damage", p.registers[4]},
                          {"speed", p.registers[5]},
                          {"fuel", p.registers[7]},
                          {"shell",
                           {{"active", shell.active},
                            {"x", shell.x},
                            {"y", shell.y},
                            {"origin_x", shell.origin_x},
                            {"origin_y", shell.origin_y},
                            {"delta_x", shell.delta_x},
                            {"delta_y", shell.delta_y},
                            {"duration", shell.duration},
                            {"elapsed", shell.elapsed}}}});
      }
      json view_events = json::array();
      for (const auto &event : view_events_)
        view_events.push_back(event_json(event));
      result["done"] = done_;
      result["view"] = {{"width", 381},
                        {"height", 313},
                        {"robots", std::move(glyphs)},
                        {"events", std::move(view_events)}};
    }
    return result;
  }
};

// One active session per synchronous native process or WASM worker.
std::unique_ptr<BattleSession> active_battle;

json battle_json(const json &input) {
  BattleSession session(input, false);
  session.run();
  return session.snapshot();
}

} // namespace

json dispatch_json(const json &input) {
  const auto kind = input.at("kind").get<std::string>();
  if (kind == "compile")
    return compile_json(input);
  if (kind == "battle")
    return battle_json(input);
  if (kind == "battle_start") {
    // Invalid replacement requests must never leave an older battle running.
    active_battle.reset();
    auto session = std::make_unique<BattleSession>(input, true);
    auto result = session->snapshot();
    active_battle = std::move(session);
    return result;
  }
  if (kind == "battle_step") {
    if (!active_battle)
      throw std::logic_error("No active battle; call battle_start first");
    const auto &ticks = input.at("ticks");
    if (!ticks.is_number_integer() || ticks < 1 || ticks > 100)
      throw std::invalid_argument("battle_step ticks must be an integer from 1 to 100");
    active_battle->advance(ticks.get<unsigned>());
    return active_battle->snapshot();
  }
  if (kind == "battle_stop") {
    active_battle.reset();
    return {{"stopped", true}};
  }
  if (kind == "parse") {
    auto t = robotwar::scan_token(robot_source(input), input.value("offset", 0),
                                  input.value("has_operand", false));
    return {{"kind", t.kind},   {"operation", t.operation}, {"attribute", t.attribute},
            {"value", t.value}, {"symbol", t.symbol},       {"next_offset", t.next_offset},
            {"error", t.error}};
  }
  if (kind == "vm")
    return robotwar::vm_json(input);
  if (kind.rfind("world_", 0) == 0)
    return robotwar::world_json(input);
  throw std::invalid_argument("Unknown operation: " + kind);
}

std::string request_json(std::string_view input) {
  try {
    return dispatch_json(json::parse(input.begin(), input.end())).dump();
  } catch (const std::exception &error) {
    return json{{"exception", error.what()}}.dump(-1, ' ', false, json::error_handler_t::replace);
  } catch (...) {
    return R"({"exception":"Unknown request failure"})";
  }
}
} // namespace robotwar
