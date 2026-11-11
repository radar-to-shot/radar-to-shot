#include "robotwar/world.hpp"
#include "robotwar/mac_math.hpp"
#include <algorithm>
#include <cmath>
#include <limits>
#include <stdexcept>
#include <utility>

namespace robotwar {
namespace {
using Word = std::int16_t;

Word w(std::int64_t x) {
  auto u = static_cast<std::uint16_t>(x);
  return u < 32768 ? static_cast<Word>(u) : static_cast<Word>(static_cast<int>(u) - 65536);
}

Word absw(Word x) {
  return x < 0 ? w(-static_cast<int>(x)) : x;
}

int sign(int x) {
  return (x > 0) - (x < 0);
}

int rounded(double x) {
  return static_cast<int>(std::round(x));
}

int conversion_bearing(int x, int y) {
  if (!x)
    return y > 0 ? 180 : 0;
  if (!y)
    return x > 0 ? 90 : 270;
  if (y > 0)
    return x > 0 ? 90 + rounded(std::atan(double(y) / x) * 57.29578)
                 : 180 + rounded(std::atan(-double(x) / y) * 57.29578);
  return x > 0 ? rounded(std::atan(-double(x) / y) * 57.29578)
               : 270 + rounded(std::atan(double(y) / x) * 57.29578);
}

struct Rect {
  int top, left, bottom, right;
};

Rect rect(const WorldRobot &r, int dx = 0, int dy = 0) {
  return {r.registers[1] - 5 + dy, r.registers[0] - 5 + dx, r.registers[1] + 6 + dy,
          r.registers[0] + 6 + dx};
}

bool intersects(Rect a, Rect b) {
  return a.left < b.right && b.left < a.right && a.top < b.bottom && b.top < a.bottom;
}

void stop(WorldRobot &r) {
  r.registers[5] = 0;
  r.velocity_x = r.velocity_y = r.target_x = r.target_y = 0;
}
} // namespace

World::World(Word width, Word height) : width_(width), height_(height) {
  if (width < 12 || height < 12)
    throw std::invalid_argument("battlefield is too small");
}

std::vector<WorldPlacement> World::random_placements(std::size_t count,
                                                     const std::function<Word()> &random_word) {
  if (count > 5)
    throw std::length_error("original supports at most five robots");
  if (!random_word)
    throw std::invalid_argument("placement requires a random word source");
  constexpr int origins[5][2] = {{7, 7}, {7, 160}, {136, 7}, {260, 7}, {260, 160}};
  std::array<bool, 5> used{};
  std::vector<WorldPlacement> result;
  while (result.size() < count) {
    int region = 0;
    for (std::size_t attempts = 0;; ++attempts) {
      if (attempts == 65536)
        throw std::runtime_error("random source did not select an unused region");
      // QuickDraw Random maps -32768 to zero before returning it. Reject an
      // injected source outside that contract instead of indexing before used.
      Word draw = random_word();
      if (draw == -32768)
        throw std::invalid_argument("placement source must follow QuickDraw Random word range");
      region = std::abs(int(draw)) % 5;
      if (!used[region])
        break;
    }
    used[region] = true;
    auto magnitude = [&] {
      Word draw = random_word();
      if (draw == -32768)
        throw std::invalid_argument("placement source must follow QuickDraw Random word range");
      return std::abs(int(draw));
    };
    const Word x = w(origins[region][0] + magnitude() % 108);
    const Word y = w(origins[region][1] + magnitude() % (region == 2 ? 280 : 130));
    result.push_back({x, y, w(region + 1)});
  }
  return result;
}

std::size_t World::add_robot(const std::array<Word, 7> &a, Word x, Word y) {
  if (robots_.size() == 5)
    throw std::length_error("original supports at most five robots");
  constexpr std::array<int, 7> limits = {2, 4, 1, 2, 2, 1, 5};
  for (std::size_t i = 0; i < a.size(); ++i)
    if (a[i] < 0 || a[i] > limits[i])
      throw std::invalid_argument("invalid robot attribute");
  if (x < 5 || y < 5 || x > width_ - 5 || y > height_ - 5)
    throw std::invalid_argument("robot outside battlefield");
  WorldRobot r;
  r.attributes = a;
  r.registers[0] = x;
  r.registers[1] = y;
  constexpr int fuel[] = {1850, 2500, 3200}, armor[] = {100, 115, 130, 145, 165, 200},
                radar[] = {200, 310, 500};
  r.registers[7] = fuel[a[4]];
  r.registers[16] = 0;
  r.armor = armor[a[6]];
  r.radar_range = radar[a[3]];
  robots_.push_back(r);
  for (auto &q : robots_)
    q.registers[9] = static_cast<Word>(robots_.size() - 1);
  return robots_.size() - 1;
}

WorldRobot &World::state(std::size_t i) {
  return robots_.at(i);
}

const WorldRobot &World::state(std::size_t i) const {
  return robots_.at(i);
}

WorldSnapshot World::snapshot() const {
  return {ticks_, robots_};
}

void World::set_event_sink(EventSink sink) {
  sink_ = std::move(sink);
}

void World::emit(WorldEvent::Kind k, std::size_t i, std::size_t j, Word v) {
  if (sink_)
    sink_({k, ticks_, i, j, robots_[i].registers[0], robots_[i].registers[1], v});
}

Word World::normalize_angle(Word x) {
  return x < 0 ? w(360 - std::abs(int(x) % 360)) : w(x % 360);
}

Word World::sine(Word x) {
  // Captured from the original CODE2 initialization executing IIci ROM SANE.
  static constexpr std::array<Word, 181> table = {
#include "sine_table.inc"
  };
  int angle = normalize_angle(x);
  return angle >= 180 ? w(-table[angle - 180]) : table[angle];
}

Word World::cosine(Word x) {
  return sine(w(x + 90));
}

Word World::approximate_distance(Word x, Word y) {
  x = absw(x);
  y = absw(y);
  Word sum = w(x + y);
  if (x == y)
    return w(w(x * 14 + 5) / 10);
  Word ratio = w(w(sum * 10) / absw(w(x - y)));
  int numerator, denominator, round;
  if (ratio < 11) {
    numerator = 59;
    denominator = 60;
    round = 30;
  } else if (ratio < 12) {
    numerator = 15;
    denominator = 16;
    round = 8;
  } else if (ratio < 14) {
    numerator = 17;
    denominator = 19;
    round = 9;
  } else if (ratio < 16) {
    numerator = 17;
    denominator = 20;
    round = 10;
  } else if (ratio < 18) {
    numerator = 9;
    denominator = 11;
    round = 6;
  } else if (ratio < 20) {
    numerator = 8;
    denominator = 10;
    round = 5;
  } else if (ratio < 30) {
    numerator = 16;
    denominator = 21;
    round = 10;
  } else if (ratio < 40) {
    numerator = 25;
    denominator = 34;
    round = 17;
  } else {
    numerator = 18;
    denominator = 25;
    round = 12;
  }
  return w(w(sum * numerator + round) / denominator);
}

void World::add_damage(WorldRobot &r, Word n) {
  r.raw_damage = w(r.raw_damage + n);
  if (!r.armor)
    throw std::domain_error("zero armor divisor");
  r.registers[4] = w(w(r.raw_damage * 100) / r.armor);
  r.damage_flash = w(r.damage_flash + w(n + 1) / 2);
}

void World::accelerate_and_burn(WorldRobot &r) {
  r.collided = false;
  int maximum = r.attributes[2] ? 4000 : 2000, acceleration = r.attributes[2] ? 400 : 200;
  auto advance = [&](Word current, Word target) {
    Word difference = w(target - current);
    if (difference < 0 && current > -maximum)
      current = w(std::max(-maximum, current - acceleration));
    else if (difference > 0 && current < maximum)
      current = w(std::min(maximum, current + acceleration));
    return current;
  };
  r.velocity_x = advance(r.velocity_x, r.target_x);
  r.velocity_y = advance(r.velocity_y, r.target_y);
  Word fuel = w(r.registers[7] - absw(r.registers[5]) / 10);
  if (r.registers[8])
    fuel = w(fuel - 8);
  if (fuel <= 0) {
    fuel = 0;
    if (!r.exhausted) {
      r.exhausted = true;
      r.registers[8] = r.registers[5] = 0;
      r.target_x = r.target_y = 0;
      ++r.out_of_fuel;
    }
  }
  r.registers[7] = fuel;
}

Word World::read_register(std::size_t i, Word reg) const {
  if (reg < 0 || reg >= 19)
    return 0;
  return reg == 16 ? state(i).radar_result : state(i).registers[reg];
}

int World::write_register(std::size_t i, Word reg, Word value) {
  auto &r = state(i);
  auto &a = r.registers;
  switch (reg) {
  case 2:
  case 6:
    a[reg] = normalize_angle(value);
    return 0;
  case 3: {
    if (a[3])
      return 0;
    auto &s = r.shell;
    s.active = true;
    s.origin_x = s.x = a[0];
    s.origin_y = s.y = a[1];
    s.delta_x = w(int(sine(a[2])) * value / 1600);
    s.delta_y = w(-int(cosine(a[2])) * value / 1600);
    s.duration = w(absw(value) / 18 + 1);
    s.elapsed = 0;
    constexpr Word reload[] = {28, 20, 15, 11, 7};
    a[3] = std::max(reload[r.attributes[1]], s.duration);
    emit(WorldEvent::Kind::Shot, i, i, value);
    return 10;
  }
  case 5:
    if (a[7] > 0)
      a[5] = std::clamp<Word>(value, 0, r.attributes[2] ? 40 : 20);
    return 0;
  case 8:
    if (r.attributes[5] > 0 && a[7] > 0)
      a[8] = value;
    return 0;
  case 10:
  case 11:
  case 12:
  case 14:
  case 17:
    a[reg] = value;
    return 0;
  case 13:
    a[13] = value;
    a[14] = w(conversion_bearing(a[12], a[13]));
    // The original adds signed 32-bit squares before SANE sqrt. Both -32768
    // operands overflow that sum to INT32_MIN; SANE's invalid-result integer
    // conversion returns 0x80000000, whose stored low word is zero.
    a[15] = a[12] == -32768 && a[13] == -32768
                ? 0
                : w(rounded(std::hypot(double(a[12]), double(a[13]))));
    return 50;
  case 15:
    a[15] = value;
    a[12] = w(rounded(std::sin(double(a[14]) * 0.017453293) * value));
    a[13] = w(rounded(-std::cos(double(a[14]) * 0.017453293) * value));
    return 50;
  case 16:
    a[16] = normalize_angle(value);
    r.radar_result = scan(i, a[16]);
    return 40;
  default:
    return 0;
  }
}

void World::begin_tick() {
  int count = 0;
  for (auto &r : robots_)
    count += r.active;
  for (auto &r : robots_)
    if (r.active) {
      r.registers[9] = w(count - 1);
      if (r.registers[3] > 0) {
        --r.registers[3];
        if (r.registers[3] == 0 && r.shell.active)
          r.registers[3] = 1;
      }
    }
}

void World::end_cpu_slice(std::size_t i) {
  auto &r = state(i);
  if (r.registers[5] != r.previous_speed || r.registers[6] != r.previous_direction) {
    r.target_x = w(w((sine(r.registers[6]) / 4) * r.registers[5]) / 4);
    r.target_y = w(w((cosine(r.registers[6]) / 4) * r.registers[5]) / -4);
  }
  r.previous_speed = r.registers[5];
  r.previous_direction = r.registers[6];
}

Word World::scan(std::size_t i, Word angle) const {
  const auto &r = state(i);
  int best = 1000;
  const WorldRobot *selected = nullptr;
  for (std::size_t j = 0; j < robots_.size(); ++j) {
    const auto &q = robots_[j];
    if (i == j || !q.active || q.registers[8])
      continue;
    int dx = q.registers[0] - r.registers[0], dy = q.registers[1] - r.registers[1];
    int delta = std::abs(int(angle) - mac::point_to_angle(w(dx), w(dy)));
    if (delta > 180)
      delta = 360 - delta;
    if (delta >= 33)
      continue;
    int distance = approximate_distance(w(dx), w(dy));
    if (!distance)
      distance = 1;
    if (delta <= 310 / distance + 1 && distance < best && distance < r.radar_range) {
      best = distance;
      selected = &q;
    }
  }
  return selected ? w(rounded(std::hypot(double(selected->registers[0] - r.registers[0]),
                                         double(selected->registers[1] - r.registers[1]))))
                  : -1;
}

void World::move_robots() {
  for (std::size_t i = 0; i < robots_.size(); ++i)
    if (robots_[i].active) {
      bool exhausted = robots_[i].exhausted;
      accelerate_and_burn(robots_[i]);
      if (!exhausted && robots_[i].exhausted)
        emit(WorldEvent::Kind::FuelExhausted, i, i);
    }
  // CODE3:0880 repeatedly resolves the earliest collision, then recomputes the
  // remaining tentative rectangles. The remainders really do advance again.
  for (std::size_t iteration = 0; iteration <= robots_.size(); ++iteration) {
    int earliest = 32767;
    std::size_t first = 0, second = robots_.size();
    int first_dx = 0, first_dy = 0, second_dx = 0, second_dy = 0;
    std::vector<std::array<int, 2>> moves(robots_.size());
    for (std::size_t i = 0; i < robots_.size(); ++i) {
      auto &r = robots_[i];
      if (!r.active || r.collided)
        continue;
      int sx = w(r.remainder_x + r.velocity_x), sy = w(r.remainder_y + r.velocity_y);
      int dx = sx / 1000, dy = sy / 1000;
      r.remainder_x = w(sx - dx * 1000);
      r.remainder_y = w(sy - dy * 1000);
      moves[i] = {dx, dy};
      Rect proposed = rect(r, dx, dy);
      auto choose = [&](int time, std::size_t other, int ox, int oy) {
        if (time < earliest) {
          earliest = time;
          first = i;
          second = other;
          first_dx = dx;
          first_dy = dy;
          second_dx = ox;
          second_dy = oy;
        }
      };
      if (proposed.top < 0 && dy)
        choose(w(std::abs(std::abs(dy) - std::abs(proposed.top)) * 1000) / std::abs(dy),
               robots_.size(), 0, 0);
      else if (proposed.bottom > height_ + 1 && dy)
        choose(w(std::abs(std::abs(dy) - std::abs(proposed.bottom - height_ - 1)) * 1000) /
                   std::abs(dy),
               robots_.size(), 0, 0);
      if (proposed.left < 0 && dx)
        choose(w(std::abs(std::abs(dx) - std::abs(proposed.left)) * 1000) / std::abs(dx),
               robots_.size(), 0, 0);
      else if (proposed.right > width_ + 1 && dx)
        choose(w(std::abs(std::abs(dx) - std::abs(proposed.right - width_ - 1)) * 1000) /
                   std::abs(dx),
               robots_.size(), 0, 0);
      for (std::size_t j = 0; j < robots_.size(); ++j) {
        const auto &q = robots_[j];
        if (i == j || !q.active)
          continue;
        int ox = w(q.remainder_x + q.velocity_x) / 1000,
            oy = w(q.remainder_y + q.velocity_y) / 1000;
        int rx = dx - ox, ry = dy - oy, px = r.registers[0] - q.registers[0],
            py = r.registers[1] - q.registers[1];
        bool approaching = !((rx <= 0 && px <= -11) || (rx >= 0 && px >= 11) ||
                             (ry <= 0 && py <= -11) || (ry >= 0 && py >= 11));
        bool collision =
            (intersects(proposed, rect(q)) && (approaching || q.collided)) ||
            (!q.collided && j < i && intersects(proposed, rect(q, moves[j][0], moves[j][1])));
        if (!collision)
          continue;
        if (q.collided) {
          rx = dx;
          ry = dy;
        }
        int tx = (std::abs(px) < 11 || !rx) ? 0 : w((std::abs(px) - 11) * 1000) / std::abs(rx);
        int ty = (std::abs(py) < 11 || !ry) ? 0 : w((std::abs(py) - 11) * 1000) / std::abs(ry);
        choose(std::max(tx, ty), j, ox, oy);
      }
    }
    if (earliest == 32767) {
      for (std::size_t i = 0; i < robots_.size(); ++i) {
        auto &r = robots_[i];
        if (r.active && !r.collided) {
          r.registers[0] = w(r.registers[0] + moves[i][0]);
          r.registers[1] = w(r.registers[1] + moves[i][1]);
        }
      }
      break;
    }
    auto &r = robots_[first];
    r.registers[0] = w(r.registers[0] + w(first_dx * earliest + sign(first_dx) * 550) / 1000);
    r.registers[1] = w(r.registers[1] + w(first_dy * earliest + sign(first_dy) * 550) / 1000);
    r.collided = true;
    Word damage = w(approximate_distance(w(r.velocity_x / 100), w(r.velocity_y / 100)) / 6);
    if (second < robots_.size()) {
      auto &q = robots_[second];
      if (!q.collided) {
        q.registers[0] = w(q.registers[0] + w(second_dx * earliest + sign(second_dx) * 499) / 1000);
        q.registers[1] = w(q.registers[1] + w(second_dy * earliest + sign(second_dy) * 499) / 1000);
      }
      q.collided = true;
      damage = w(damage + approximate_distance(w(q.velocity_x / 100), w(q.velocity_y / 100)) / 6);
      add_damage(q, damage);
      q.collision_damage += damage;
      stop(q);
    }
    add_damage(r, damage);
    r.collision_damage += damage;
    stop(r);
    emit(WorldEvent::Kind::Collision, first, second, damage);
  }
}

void World::explode(std::size_t owner, Word x, Word y) {
  auto &source = robots_[owner];
  for (auto &q : robots_)
    if (q.active) {
      int dx = std::abs(int(q.registers[0]) - x), dy = std::abs(int(q.registers[1]) - y);
      if (dx + dy >= 24)
        continue;
      int d = rounded(std::sqrt(double(dx * dx + dy * dy)));
      if (d > 15)
        continue;
      Word damage = d < 6 ? 20 : w(16 - d);
      add_damage(q, damage);
      if (&q == &source)
        source.damage_to_self += damage;
      else
        source.damage_to_others += damage;
    }
  if (sink_)
    sink_({WorldEvent::Kind::Explosion, ticks_, owner, owner, x, y, 0});
}

void World::destroy_robots() {
  for (std::size_t i = 0; i < robots_.size(); ++i)
    if (robots_[i].active && robots_[i].registers[4] >= 100) {
      robots_[i].registers[4] = 100;
      robots_[i].active = false;
      for (auto &q : robots_)
        if (q.active)
          ++q.score;
      emit(WorldEvent::Kind::Destroyed, i, i);
    }
}

void World::update_shells() {
  for (std::size_t i = 0; i < robots_.size(); ++i) {
    auto &r = robots_[i];
    if (r.active && r.registers[4] >= 100) {
      r.registers[4] = 100;
      r.active = false;
      for (auto &q : robots_)
        if (q.active)
          ++q.score;
      emit(WorldEvent::Kind::Destroyed, i, i);
      continue;
    }
    auto &s = r.shell;
    if (!s.active)
      continue;
    ++s.elapsed;
    if (!s.duration)
      throw std::domain_error("zero shot duration");
    Word x, y;
    int dx, dy;
    bool boom = s.elapsed == s.duration;
    if (boom) {
      x = w(s.origin_x + s.delta_x);
      y = w(s.origin_y + s.delta_y);
      dx = x - s.x;
      dy = y - s.y;
    } else {
      x = w(w(s.delta_x * s.elapsed) / s.duration + s.origin_x);
      y = w(w(s.delta_y * s.elapsed) / s.duration + s.origin_y);
      dx = s.delta_x / s.duration;
      dy = s.delta_y / s.duration;
    }
    if (x < 0 || y < 0 || x > width_ || y > height_) {
      int tx = 0, ty = 0;
      if (dx) {
        if (x < 0)
          tx = std::abs(w(x * 20) / dx);
        else if (x > width_ + 1)
          tx = std::abs(w((x - width_ - 1) * 20) / dx);
      }
      if (dy) {
        if (y < 0)
          ty = std::abs(w(y * 20) / dy);
        else if (y > height_ + 1)
          ty = std::abs(w((y - height_ - 1) * 20) / dy);
      }
      int amount = std::max(tx, ty);
      x = w(x - w(dx * amount) / 20);
      y = w(y - w(dy * amount) / 20);
      boom = true;
    }
    if (boom) {
      --s.elapsed;
      s.active = false;
      explode(i, x, y);
    } else {
      s.x = x;
      s.y = y;
    }
  }
}

void World::update_physics() {
  move_robots();
  update_shells();
  ++ticks_;
}

void World::tick() {
  begin_tick();
  for (std::size_t i = 0; i < robots_.size(); ++i)
    end_cpu_slice(i);
  update_physics();
}
} // namespace robotwar
