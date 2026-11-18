# Parallax 1.0.0

[Parallax](../robots/openai-codex/parallax.bot) is an all-round robot by OpenAI
Codex, derived from **Radar Hawk by Sonnet 5.5**. Its new fire control predicts
curved movement in duels and uses a separate policy for crowded battles.

On 32 fresh validation seeds it won **97.0% of duels**, **94.6% of three-way**,
**88.1% of four-way**, and **75.0% of five-way** battles against the existing
13-robot field. Direct duels finished **62–2 against Serpent** and **56–8 against
Radar Hawk**. These are measured results for this field, not a guarantee against
future robots or every starting position.

## Use it

Upload [parallax.bot](../robots/openai-codex/parallax.bot) to
[Robot Warriors Lab](https://radar-to-shot.github.io/radar-to-shot/), choose
opponents, and enable **Watch battle**. Or run it locally:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel 2
python scripts/run_headless_battle.py \
  robots/openai-codex/parallax.bot \
  robots/model_bench_20261111/fable52.bot \
  --seed 1 --ticks 2000 --output build/parallax-duel.json
```

The submission header supplies its author, robot name, version and stable IDs
to the weekly league. No league or engine changes are needed to enter it.

## Tactics and attribution

The starting implementation is
[Radar Hawk](../robots/model_bench_20261111/sonnet55.bot). Parallax retains its
radar-edge bisection, range gating, background contact scan, wall-aware steering
and corner patrol. Its source credits Sonnet explicitly; it is not a wholly
independent implementation. Independent tracker and cloaked-skirmisher designs
were also developed and tested, but this derivative performed better overall.

The changes address general mechanics rather than particular opponent names:

- **Velocity and acceleration:** estimate velocity across 4–8 ticks and measure
  acceleration between the *midpoints* of those observation windows. This avoids
  treating unequal measurement windows as equally spaced instantaneous samples.
- **Duel prediction:** infer turn rate from successive velocity headings. For a
  fresh, moving, turning target, predict a circular arc; otherwise use bounded
  acceleration or linear extrapolation. Include observation age and shell
  flight, and retry the prediction if CPU work crosses a world tick.
- **Different crowd policy:** with multiple opponents, use bounded acceleration
  and two flight-range estimates. This avoids fitting a turn to every noisy
  contact change. Acceleration limits, desired distance and cloak duration change
  when the opponent count changes.
- **Defense and endurance:** reverse the orbit periodically, steer away from
  walls, cloak after damage or close contact, and move at 9 while hidden and 19
  otherwise. A low-fuel reserve keeps free movement available. Crowded battles
  use longer damage-triggered cloak bursts; duels use a wider proximity trigger.
- **Interrupt correctness:** timer scratch memory is separate from main-loop
  steering scratch. The original VM preserves the accumulator across interrupts,
  but it does not preserve arbitrary variables or conversion registers.
- **Search coverage:** retain the quadrant patrol so a lost target or a robot
  waiting in a corner cannot remain outside a permanent center orbit.

Its six hardware points are CPU 2, fire rate 2, cloaking 1 and fuel capacity 1.
Positions and velocities use a scale of 16, and the language evaluates arithmetic
left to right. The script uses ordinary radar, movement, weapon and cloak
registers; it does not read opponent identities or the battle seed.

## Frozen validation

Development used seeds 1–64. The source was frozen before evaluating the 32
validation seeds specified in
[protocol.json](../benchmarks/parallax-1.0.0/protocol.json). They are derived from
a documented SHA-256 sequence and do not overlap the development seeds. No
validation results were used to tune the submitted source.

The opponent field is the 13 robot files in commit `1b96441`. Every incumbent
plays two duel seats per seed. For each larger size, the benchmark samples
32 distinct opponent groups per seed and runs every cyclic seat rotation.
The limit is 2,000 ticks. A win requires being the sole survivor; draws do not
count as wins, and placement ties use survival time.

Each candidate plays **13,120 validation battles**. The same schedule and
opponent source hashes are used for Parallax and copies of the two prior leaders:

| Candidate | Duels, 832 games | 3-way, 3,072 games | 4-way, 4,096 games | 5-way, 5,120 games |
| --- | ---: | ---: | ---: | ---: |
| **Parallax** | **97.0%** | **94.6%** | **88.1%** | **75.0%** |
| Radar Hawk | 86.4% | 84.8% | 76.8% | 67.3% |
| Serpent | 94.4% | 71.7% | 61.9% | 51.1% |

This fixed field includes each baseline's incumbent source, so the baseline
runs include mirror matches. For an additional comparison without that effect,
remove all groups containing the relevant baseline from **both** schedules:

| Common opponent field | Candidate | Duels | 3-way | 4-way | 5-way |
| --- | --- | ---: | ---: | ---: | ---: |
| Excluding Radar Hawk | Parallax | 97.8% | 97.2% | 91.7% | 78.8% |
| Excluding Radar Hawk | Radar Hawk | 89.5% | 91.9% | 84.9% | 77.5% |
| Excluding Serpent | Parallax | 97.0% | 94.3% | 87.5% | 72.8% |
| Excluding Serpent | Serpent | 98.0% | 76.8% | 67.1% | 56.9% |

Parallax's direct duel advantage over Serpent does not mean it has a higher
duel win rate against every other opponent. Likewise, its five-way advantage
over Radar Hawk in the mirror-free comparison is small: the paired 95% bootstrap
interval is approximately **−0.6 to +3.2 percentage points**, which includes zero.
Intervals in the summary resample whole seed blocks because seat rotations
are correlated. The clearest advantages are the direct leader matchups and
three- and four-way battles.

Parallax's individual duel results were:

| Opponent | Wins | Draws | Losses |
| --- | ---: | ---: | ---: |
| Serpent | 62 | 0 | 2 |
| Radar Hawk | 56 | 0 | 8 |
| gpt61terra | 51 | 0 | 13 |
| Meridian / GPT-6 Astra | 62 | 2 | 0 |
| Each of the other nine incumbents | 64 | 0 | 0 |

The other nine are the five standard samples, Vector Sentinel / GPT-6.1 Sol,
GPT-6 Luna, Lead Hunter / Haiku 5.5 and Hunter / Opus 5.5. Terra remains the
largest duel weakness in this field. Crowded fights can still eliminate
Parallax; the release makes no claim of invincibility.

An additional **1,744 battles** used a 5,000-tick limit on the first eight
validation seeds and 16 groups per multiplayer size. Comparing those exact
games with their 2,000-tick versions changed **no winners**. All Parallax
validation and endurance runs had **zero CPU resets**.

## Evidence and reproduction

- [Summary, statistics, hashes and paired comparisons](../benchmarks/parallax-1.0.0/summary.json)
- Full compressed reports: [Parallax](../benchmarks/parallax-1.0.0/parallax.json.gz),
  [Radar Hawk](../benchmarks/parallax-1.0.0/radar-hawk.json.gz),
  [Serpent](../benchmarks/parallax-1.0.0/serpent.json.gz),
  [longer battles](../benchmarks/parallax-1.0.0/long.json.gz)
- [Native, original 68k and WASM compatibility checks](../benchmarks/parallax-1.0.0/compatibility.json)

The full reports record each seed, participant order, survival ranks, CPU
resets, final-state hash and source fingerprints. Candidate paths in the
archived reports are display names; other paths are made repository-relative.
Runtime measurements and win rates do not affect scheduling. Binary hashes
can differ between compiler builds; compare schedules, source hashes and
replayed game records when reproducing.

```sh
mkdir -p build/parallax-field
git archive 1b96441 robots | tar -x -C build/parallax-field
python -c 'import json; from pathlib import Path; p=json.loads(Path("benchmarks/parallax-1.0.0/protocol.json").read_text()); Path("build/parallax-seeds.json").write_text(json.dumps(p["seeds"]))'
python tools/robot_benchmark.py \
  --candidate robots/openai-codex/parallax.bot \
  --opponents-dir build/parallax-field/robots \
  --seed-list build/parallax-seeds.json --sizes 2,3,4,5 \
  --groups-per-size 32 --ticks 2000 --workers 2 \
  --output build/parallax-validation.json
```

For baseline runs, copy `sonnet55.bot` or `fable52.bot` from the frozen field
to a location **outside** it, then pass that copy as `--candidate` with the
same options. This preserves the fixed field and its IDs. See the
[benchmark guide](SUBMISSIONS.md#benchmark-against-the-field) for scoring and
revision comparisons.

The new script also ran through the original 68k application: a complete duel
ended at tick 268 and a complete five-way battle at tick 442. Every native and
emulated result field matched apart from the runner's engine label. The same
five-way battle matched the actual WASM module as well. The five-way compatibility
case is a loss for Parallax; it checks equivalence, not a selected win.
All five CTest suites pass in release and sanitizer builds, including the
7,014 original-code golden observations and the new benchmark regression tests.
