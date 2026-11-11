#pragma once
#include "mac_math_json.hpp"
#include "robotwar/mac_math.hpp"
#include "robotwar/world.hpp"
#include <nlohmann/json.hpp>
#include <stdexcept>

namespace robotwar {
inline nlohmann::json world_json(const nlohmann::json &in) {
  const std::string kind = in.at("kind");
  using nlohmann::json;
  using robotwar::World;
  using robotwar::WorldRobot;
  if (kind == "world_random")
    return quickdraw_random_json(in);
  if (kind == "world_placement") {
    mac::QuickDrawRandom random(in.value("seed", 1u));
    const auto placements = World::random_placements(
        in.at("count").get<std::size_t>(), [&] { return random(); });
    json robots = json::array();
    for (const auto &p : placements)
      robots.push_back({{"x", p.x}, {"y", p.y}, {"region", p.region}});
    return {{"robots", robots}, {"seed", random.seed()}};
  }
  if (kind == "world_angle")
    return {{"angle", mac::point_to_angle(in.at("x").get<std::int16_t>(),
                                          in.at("y").get<std::int16_t>())}};
  if (kind == "world_distance")
    return {{"distance",
             World::approximate_distance(in.at("x").get<std::int16_t>(),
                                         in.at("y").get<std::int16_t>())}};
  if (kind == "world_damage") {
    WorldRobot r;
    r.armor = in.value("armor", 100);
    r.raw_damage = in.value("raw_damage", 0);
    r.damage_flash = in.value("damage_flash", 0);
    World::add_damage(r, in.at("damage").get<std::int16_t>());
    return {{"raw_damage", r.raw_damage},
            {"damage_percent", r.registers[4]},
            {"damage_flash", r.damage_flash}};
  }
  if (kind == "world_motion") {
    WorldRobot r;
    r.attributes[2] = in.value("engine", 0);
    r.velocity_x = in.value("vx", 0);
    r.velocity_y = in.value("vy", 0);
    r.target_x = in.value("target_x", 0);
    r.target_y = in.value("target_y", 0);
    r.registers[7] = in.value("fuel", 1850);
    r.registers[5] = in.value("speed", 0);
    r.registers[8] = in.value("cloak", 0);
    r.exhausted = in.value("exhausted", false);
    r.out_of_fuel = in.value("out_of_fuel", 0);
    World::accelerate_and_burn(r);
    return {{"vx", r.velocity_x},          {"vy", r.velocity_y},
            {"target_x", r.target_x},      {"target_y", r.target_y},
            {"fuel", r.registers[7]},      {"speed", r.registers[5]},
            {"cloak", r.registers[8]},     {"exhausted", r.exhausted},
            {"out_of_fuel", r.out_of_fuel}};
  }
  if (kind == "world_trig")
    return {
        {"angle", World::normalize_angle(in.at("angle").get<std::int16_t>())},
        {"sin", World::sine(in.at("angle").get<std::int16_t>())},
        {"cos", World::cosine(in.at("angle").get<std::int16_t>())}};
  if (kind == "world_movement") {
    World world;
    for (const auto &j : in.at("robots")) {
      std::array<std::int16_t, 7> a{};
      a[2] = j.value("engine", 0);
      auto id = world.add_robot(a, j.value("x", 100), j.value("y", 100));
      auto &r = world.state(id);
      r.velocity_x = j.value("vx", 0);
      r.velocity_y = j.value("vy", 0);
      r.target_x = j.value("target_x", 0);
      r.target_y = j.value("target_y", 0);
      r.remainder_x = j.value("remainder_x", 0);
      r.remainder_y = j.value("remainder_y", 0);
      r.registers[7] = j.value("fuel", 1850);
      r.registers[5] = j.value("speed", 0);
      r.registers[8] = j.value("cloak", 0);
      r.armor = j.value("armor", 100);
      r.raw_damage = j.value("raw_damage", 0);
    }
    for (int t = 0; t < in.value("ticks", 1); ++t)
      world.update_physics();
    json out = json::array();
    for (std::size_t i = 0; i < world.size(); ++i) {
      const auto &r = world.state(i);
      out.push_back({{"x", r.registers[0]},
                     {"y", r.registers[1]},
                     {"vx", r.velocity_x},
                     {"vy", r.velocity_y},
                     {"target_x", r.target_x},
                     {"target_y", r.target_y},
                     {"remainder_x", r.remainder_x},
                     {"remainder_y", r.remainder_y},
                     {"fuel", r.registers[7]},
                     {"speed", r.registers[5]},
                     {"cloak", r.registers[8]},
                     {"raw_damage", r.raw_damage},
                     {"damage_percent", r.registers[4]},
                     {"damage_flash", r.damage_flash},
                     {"collision_damage", r.collision_damage},
                     {"collided", r.collided},
                     {"exhausted", r.exhausted},
                     {"out_of_fuel", r.out_of_fuel}});
    }
    return {{"robots", out}};
  }
  if (kind == "world_io") {
    World world;
    std::array<std::int16_t, 7> a{};
    if (in.contains("attributes"))
      a = in.at("attributes").get<std::array<std::int16_t, 7>>();
    auto robots = in.value("robots", json::array({{{"x", 100}, {"y", 100}}}));
    for (auto &j : robots) {
      auto id = world.add_robot(a, 100, 100);
      auto &r = world.state(id);
      r.registers[0] = j.value("x", 100);
      r.registers[1] = j.value("y", 100);
      r.registers[8] = j.value("cloak", 0);
    }
    json costs = json::array();
    for (auto &entry : in.at("writes"))
      costs.push_back(world.write_register(0, entry[0].get<std::int16_t>(),
                                           entry[1].get<std::int16_t>()));
    const auto &r = world.state(0);
    const auto &shell = r.shell;
    return {{"registers", r.registers},
            {"radar_result", r.radar_result},
            {"costs", costs},
            {"shell",
             {{"active", shell.active},
              {"origin_x", shell.origin_x},
              {"origin_y", shell.origin_y},
              {"delta_x", shell.delta_x},
              {"delta_y", shell.delta_y},
              {"duration", shell.duration},
              {"elapsed", shell.elapsed},
              {"x", shell.x},
              {"y", shell.y}}}};
  }
  if (kind == "world_shells") {
    World world;
    std::array<std::int16_t, 7> a{};
    if (in.contains("attributes"))
      a = in.at("attributes").get<std::array<std::int16_t, 7>>();
    auto robots = in.value("robots", json::array({{{"x", 100}, {"y", 100}}}));
    for (auto &j : robots) {
      auto id = world.add_robot(a, j.value("x", 100), j.value("y", 100));
      world.state(id).registers[8] = j.value("cloak", 0);
    }
    for (auto &entry : in.at("writes"))
      world.write_register(0, entry[0].get<std::int16_t>(),
                           entry[1].get<std::int16_t>());
    for (int t = 0; t < in.value("ticks", 1); ++t)
      world.update_physics();
    json out = json::array();
    for (std::size_t i = 0; i < world.size(); ++i) {
      const auto &r = world.state(i);
      out.push_back({{"raw_damage", r.raw_damage},
                     {"damage_percent", r.registers[4]},
                     {"damage_flash", r.damage_flash},
                     {"damage_to_self", r.damage_to_self},
                     {"damage_to_others", r.damage_to_others},
                     {"shell_active", r.shell.active},
                     {"shell_elapsed", r.shell.elapsed},
                     {"shell_x", r.shell.x},
                     {"shell_y", r.shell.y}});
    }
    return {{"robots", out}};
  }
  throw std::invalid_argument("unknown world vector kind: " + kind);
}

} // namespace robotwar
