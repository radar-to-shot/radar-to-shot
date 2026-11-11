#include "robotwar/mac_math.hpp"
#include <array>
#include <bit>
#include <cstdint>
#include <limits>

namespace robotwar::mac {
namespace {
// Original IIci ROM SlopeFromAngle data. For angles <64 the integer part is
// selected by the routine; angles >=64 use ROM+0x3ce71+angle. Fractional words
// are ROM+0x3cecc+2*angle. Values are signed 16.16 fixed point.
constexpr std::array<std::int32_t,91> slopes{
    0,1144,2289,3435,4583,5734,6888,
    8047,9210,10380,11556,12739,13930,15130,
    16340,17560,18792,20036,21294,22566,23853,
    25157,26478,27818,29179,30560,31964,33392,
    34846,36327,37837,39378,40951,42560,44205,
    45889,47615,49385,51202,53070,54991,56970,
    59009,61113,63287,65536,67865,70279,72785,
    75391,78103,80930,83882,86969,90203,93595,
    97161,100917,104879,109070,113512,118230,123255,
    128622,134369,140542,147196,154393,162207,170727,
    180059,190330,201699,214358,228551,244584,262850,
    283867,308322,337153,371673,413777,466312,533747,
    623533,749079,937205,1250493,1876695,3754544,2147483647
};
std::int32_t fix_ratio(std::int16_t numerator, std::int16_t denominator) {
    if (!denominator) return numerator < 0 ? -2147483647 : 2147483647;
    if (numerator == denominator) return 65536;
    const auto dividend=std::bit_cast<std::int32_t>(
        std::uint32_t(static_cast<std::uint16_t>(numerator)) << 16);
    const auto quotient=std::int64_t(dividend)/denominator;
    // 68020 DIVS.L leaves the destination unchanged on signed overflow.
    if (quotient>std::numeric_limits<std::int32_t>::max() ||
        quotient<std::numeric_limits<std::int32_t>::min()) return dividend;
    return static_cast<std::int32_t>(quotient);
}
}
std::int16_t point_to_angle(std::int16_t x, std::int16_t y) {
    if (!x) return y>0 ? 180 : 0;
    // A square's height/width FixRatio is exactly 1.0; FixMul preserves slope.
    const auto slope=fix_ratio(x,y);
    const bool negative=slope<0;
    const auto bits=static_cast<std::uint32_t>(slope);
    const auto magnitude=negative ? 0u-bits : bits;
    const auto threshold=std::bit_cast<std::int32_t>(magnitude-500u);
    std::size_t angle=0;
    while (angle+1<slopes.size() && threshold>slopes[angle]) ++angle;
    int result=negative ? static_cast<int>(angle) : 180-static_cast<int>(angle);
    if (x<0) result+=180;
    if (result==360) result=0;
    return static_cast<std::int16_t>(result);
}
std::int16_t QuickDrawRandom::operator()() noexcept {
    seed_=static_cast<std::uint32_t>((std::uint64_t(seed_)*16807u)%2147483647u);
    const auto low=static_cast<std::uint16_t>(seed_);
    if (low==0x8000) return 0;
    return static_cast<std::int16_t>(low<0x8000 ? int(low) : int(low)-65536);
}
}
