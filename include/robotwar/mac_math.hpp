#pragma once
#include <cstdint>

namespace robotwar::mac {
// Macintosh IIci ROM PtToAngle for a square rectangle centered at (0,0).
// X increases rightward, Y downward; north is 0 and east is 90 degrees.
// Robot Warriors uses this operation for radar geometry, not SANE conversions.
std::int16_t point_to_angle(std::int16_t x, std::int16_t y);

// Exact IIci QuickDraw Random state transition. An explicit zero seed remains
// zero, and output -32768 is mapped to zero by the original ROM routine.
// Pass this callable to Simulation's RandomWordSource for deterministic runs.
class QuickDrawRandom {
public:
  explicit QuickDrawRandom(std::uint32_t seed = 1) noexcept : seed_(seed) {}

  std::int16_t operator()() noexcept;

  std::uint32_t seed() const noexcept {
    return seed_;
  }

  void reseed(std::uint32_t value) noexcept {
    seed_ = value;
  }

private:
  std::uint32_t seed_;
};
} // namespace robotwar::mac
