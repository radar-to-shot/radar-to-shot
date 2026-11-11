#pragma once
#include <array>
#include <cstddef>
#include <cstdint>
#include <functional>
#include <vector>

namespace robotwar {

// Attribute order is the original program record order.
struct WorldRobot {
  std::array<std::int16_t, 7> attributes{}; // CPU, fire, engine, radar, fuel, cloak, armor
  std::array<std::int16_t, 19> registers{};
  std::int16_t velocity_x{}, velocity_y{}, target_x{}, target_y{}; // 100 units per m/s
  std::int16_t remainder_x{}, remainder_y{}; // /1000 metre integration remainder
  std::int16_t armor{100}, radar_range{200}, raw_damage{}, damage_flash{};
  std::int16_t previous_speed{}, previous_direction{}, radar_result{-1};
  bool active{true}, exhausted{}, collided{};
  std::int32_t score{}, damage_to_others{}, damage_to_self{}, collision_damage{}, out_of_fuel{};

  struct Shell {
    bool active{};
    std::int16_t origin_x{}, origin_y{}, delta_x{}, delta_y{}, x{}, y{}, duration{}, elapsed{};
  } shell;
};

struct WorldEvent {
  enum class Kind { Shot, Explosion, Collision, Destroyed, FuelExhausted } kind;
  std::uint64_t tick{};
  std::size_t robot{}, other{};
  std::int16_t x{}, y{}, value{};
};

struct WorldSnapshot {
  std::uint64_t tick{};
  std::vector<WorldRobot> robots;
};

struct WorldPlacement {
  std::int16_t x{}, y{}, region{};
};

class World {
public:
  using EventSink = std::function<void(const WorldEvent &)>;
  explicit World(std::int16_t width = 381, std::int16_t height = 313);
  std::size_t add_robot(const std::array<std::int16_t, 7> &attributes, std::int16_t x,
                        std::int16_t y);
  WorldRobot &state(std::size_t robot);
  const WorldRobot &state(std::size_t robot) const;

  std::size_t size() const noexcept {
    return robots_.size();
  }

  WorldSnapshot snapshot() const;
  void set_event_sink(EventSink sink);
  std::int16_t read_register(std::size_t robot, std::int16_t index) const;
  int write_register(std::size_t robot, std::int16_t index, std::int16_t value);
  void begin_tick();                     // Before running each CPU slice.
  void end_cpu_slice(std::size_t robot); // Commit commanded velocity after its CPU slice.
  void update_physics();                 // After running all CPU slices; advances 1/10
                                         // battlefield second.
  void tick(); // No CPU execution: begin_tick + end_cpu_slice + update_physics.
  std::int16_t scan(std::size_t robot, std::int16_t angle) const;

  // Independently callable translations of CODE 3 routines for differential
  // tests.
  static std::int16_t normalize_angle(std::int16_t angle);
  static std::int16_t approximate_distance(std::int16_t x, std::int16_t y);
  static std::int16_t sine(std::int16_t angle);
  static std::int16_t cosine(std::int16_t angle);
  static void add_damage(WorldRobot &robot, std::int16_t damage);
  static void accelerate_and_burn(WorldRobot &robot);
  // Original five-region selection and placement, consuming the supplied
  // Random word stream in original order. A nonprogressing source is bounded.
  static std::vector<WorldPlacement>
  random_placements(std::size_t count, const std::function<std::int16_t()> &random_word);

private:
  std::vector<WorldRobot> robots_;
  EventSink sink_;
  std::uint64_t ticks_{};
  std::int16_t width_, height_;
  void emit(WorldEvent::Kind kind, std::size_t robot, std::size_t other, std::int16_t value = 0);
  void move_robots();
  void update_shells();
  void explode(std::size_t owner, std::int16_t x, std::int16_t y);
  void destroy_robots();
};
} // namespace robotwar
