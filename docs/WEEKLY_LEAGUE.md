# Weekly robot ratings and Discord leaderboard

The **Weekly robot leaderboard** workflow ranks every nonhidden regular file
under `robots/`, recursively, using the tested native engine. Each path is a
separate entrant, including the standard examples. It produces separate Elo-style
ratings for head-to-head, 3-, 4-, and 5-robot battles, plus an overall table.
Ratings are **recomputed from the current scripts every week**. No previous
rating or outdated version's results enter the fit.

## Enable weekly Discord delivery

1. In the intended Discord channel, open **Edit Channel → Integrations →
   Webhooks**, create a webhook, and copy its URL. Discord requires permission
   to manage webhooks in that channel.
2. In this repository's **Settings → Secrets and variables → Actions**, create
   the repository secret **`DISCORD_WEBHOOK_URL`** with that URL. Do not commit
   it or put it in workflow inputs. A webhook is sufficient; no Discord bot
   account or bot token is needed. A numeric `thread_id` query parameter is
   supported when posting to an existing thread.
3. Merge `.github/workflows/weekly-leaderboard.yml` into the default branch.
   GitHub runs scheduled workflows from that branch. Schedules require Actions
   to be enabled and can be delayed by GitHub; they are not an exact-time service.
4. For an initial check, run **Actions → Weekly robot leaderboard → Run workflow**
   on the default branch. Leave **publish** unchecked to generate standings and a
   Discord preview without sending. Check it to send a real leaderboard.

The schedule is **Monday at 00:17 UTC**, which is Monday **10:17 AEST / 11:17 AEDT**
in Melbourne. Edit the workflow's cron expression to change it. GitHub may disable
scheduled workflows in public repositories after 60 days without repository
activity; re-enable the workflow if that happens.

Pull requests and ordinary pushes generate results and test the integration
without posting. Only scheduled runs and explicitly published manual runs on the
default branch can enter the Discord job. The webhook secret is provided only
to its final delivery step. Missing secrets cause a clear delivery error; the
computed leaderboard remains available as an artifact. Forks need their own
webhook secret to publish.

Discord receives the top ten in each table, with complete standings attached as
`leaderboard.json` and `leaderboard.md`, plus a link to the Actions run. Invalid
scripts are listed as **unranked** with their input/compiler errors. Larger
battle sizes are explicitly unavailable if too few robots compile. If fewer
than two compile, or the engine/fit fails, no leaderboard is posted.

The full `results.json`, compact standings, Markdown and Discord preview are kept
in a dated Actions run artifact for **90 days** (subject to repository retention
policy). The JSON records the ISO week, source commit, original and normalized
source hashes, engine binary hash, schedule, seeds, execution orders, survival
placements, death ticks and final-state hashes. This is enough to reproduce the
league from its recorded revision. Artifacts do not store the webhook.

Discord rate-limit responses are retried up to three times, with a maximum
30-second requested delay. Other HTTP/network errors are not automatically
retried because the message might already have arrived. Check the channel before
rerunning delivery; a manual publish or rerun can create another announcement.
Robot names cannot trigger mentions, and delivery never logs the webhook URL.

## What the ratings mean

The fit uses **Bradley–Terry**, the same logistic win-probability curve used by
Elo:

```text
P(A outranks B) = 1 / (1 + 10^((rating_B - rating_A) / 400))
rating_i = 1500 + 400 * log10(strength_i)
```

A 400-point gap corresponds to 10:1 fitted pairwise odds. This is a model of
outlasting an opponent in the given battle format, not a promise of a 10:1
chance of winning a five-way battle.

Each weekly fit starts afresh. A batch maximum-likelihood fit makes ratings
independent of game-processing order. Every robot receives a regularizing prior
equivalent to **two drawn virtual games against a fixed 1500 reference**. This
keeps never-losing or never-winning robots finite. Virtual games do not appear in
reported game counts. The solver checks convergence and refuses to publish an
unconverged result. Sparse, damped Newton steps handle strongly separated large
fields without a dense matrix or numerical optimization dependencies.

For each battle:

- A surviving robot ranks above an eliminated robot.
- A robot eliminated later ranks above one eliminated earlier. All eliminations
  during the same simulation tick tie, regardless of CPU execution order.
- All robots still alive at the time limit tie. Damage, fuel, and player names
  do not break ties. Robots eliminated together also tie if none survives.
- Each unordered pair contributes a win, loss, or half-point tie to the model.
  Its weight is **`1 / (battle_size - 1)`**, so one five-way battle contributes one
  total unit of evidence per robot, just as one head-to-head battle does. The
  comparisons within a multiplayer battle are correlated, not independent games.

`death_ticks` uses the engine's zero-based world tick; null means the robot
survived. This rating rule measures survival placement and can distinguish
earlier eliminations even when a whole battle has no winner. The compact JSON's
W/D/L counters refer to whole-battle outcomes: a win requires being the sole
survivor, and a draw means no sole survivor. These counters do not replace the
pairwise placement evidence used for ratings.

The **overall score is the arithmetic mean of the four mode ratings**, giving
each format equal weight regardless of its game count. When fewer than five
robots are eligible, it averages only the available formats and records that
fact. It is a summary score, not an extra fitted Elo pool. Ratings rounded to the
same displayed tenth share rank; names only determine their display order.

A score is marked **provisional** below 32 games or below `min(5, field_size−1)`
distinct opponents. This is a coverage indicator, not a statistical confidence
interval. Rankings depend on this week's scripts, sampled opponents, seeds and
tick cap; close scores should not be read as a guaranteed ordering. Fresh weekly
ratings should not be treated as a continuous career rating, particularly when
the entrant field changes.

## Fair scheduling and scaling

Every mode gives every eligible robot exactly the same number of games. All
scheduled groups play **every cyclic rotation of their execution order**, giving
each robot equal exposure to every starting slot and first-to-last CPU slot.
This balances seats; it does not claim to exhaust all `k!` relative orders.

- If there are at most **128 distinct groups** of a given size, play every
  combination. Head-to-head is therefore a full round robin through 16 entrants.
- Otherwise, use **four balanced circular rounds**. In each round a deterministic
  permutation supplies all overlapping windows of the requested group size.
  Each robot appears in exactly `k` groups; there are no byes. The overlapping
  windows guarantee a connected opponent graph.
- For each round, choose from eight seeded candidate circles, preferring fewer
  repeated opponent encounters. Pairwise exposure is approximately balanced;
  this heuristic does not claim perfectly equal counts for every pair.
- Each mode has at least **two independent seed blocks**, increased when needed
  to give every entrant at least **32 actual games**. Seeds are shared across
  groups within a round/block, and all rotations reuse that seed. Later circular
  rounds get new seeds, so a repeated group does not replay identical evidence.

Scheduling and seeds are deterministic functions of the ISO week and entrant
identities. Seeds change the following week, never depend on thread timing, and
avoid degenerate QuickDraw RNG values. The native engine stops at one remaining
robot or the configured tick cap (default **2,000 ticks / 200 simulated seconds**).

With fixed budgets, large-field battle counts grow linearly with the number of
robots, avoiding enumeration of every 3/4/5-way combination. Defaults schedule
**57,344 battles for 512 robots** across all four modes. Hard limits are 512
entrants, 100,000 battles and 200,000,000 projected simulated ticks. Excess work is
rejected before scored battles begin. Each engine invocation has a 30-second
timeout; concurrent workers default to two. Compilation errors exclude individual
scripts, but unexpected engine or fit failures abort the entire publication.

## Local use and replay

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel 2
python tests/test_weekly_league.py --binary build/robotwar
python scripts/run_weekly_league.py --robots-dir robots \
  --week 2026-W46 --workers 2 --output-dir build/weekly
```

Omit `--week` to use the current UTC ISO week. `--robots-dir` can select the whole
tree or a subdirectory. Files are UTF-8 by default; `--encoding mac-roman` accepts
original Mac text instead. Names use paths relative to `robots/`, so identical
basenames in different directories remain distinct. Hidden paths are ignored;
symlinks are rejected. All nonhidden files are treated as robot sources, so keep
documentation elsewhere.

`--ticks`, `--rounds`, `--seeds` and `--workers` control local workload. Increasing
workers changes runtime only, not the schedule or result. Reproducing a league
requires its source revision, ISO week, encoding and simulation/scheduling
settings. The full JSON records all of these.

Inspect a Discord preview without any webhook or network request:

```sh
python tools/discord_leaderboard.py --dry-run --report-dir build/weekly \
  --run-url https://github.com/radar-to-shot/radar-to-shot/actions/runs/123
```

The run URL is replaced with the real run in CI. For intentional delivery, set
`DISCORD_WEBHOOK_URL` in the process environment and omit `--dry-run`. The script
accepts only HTTPS `discord.com` webhook endpoints and does not follow redirects.
Failed executions clear stale success reports; Discord refuses failed reports.

The older [head-to-head tournament](HEADLESS.md#tournaments) remains available
for selecting a champion using exact tournament points. The weekly league adds
fresh numerical strength estimates and multiplayer formats as a separate workflow.
