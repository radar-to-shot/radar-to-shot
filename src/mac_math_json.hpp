#pragma once
#include "robotwar/mac_math.hpp"
#include <nlohmann/json.hpp>
#include <stdexcept>

namespace robotwar {
inline nlohmann::json quickdraw_random_json(const nlohmann::json &input) {
  mac::QuickDrawRandom random(input.at("seed").get<std::uint32_t>());
  const auto count = input.value("count", 1);
  if (count < 0 || count > 100000)
    throw std::invalid_argument("random sample count must be 0..100000");
  auto samples = nlohmann::json::array();
  for (int i = 0; i < count; ++i) {
    const auto value = random();
    samples.push_back({{"seed", random.seed()}, {"word", value}});
  }
  return {{"seed", random.seed()}, {"samples", samples}};
}
} // namespace robotwar
