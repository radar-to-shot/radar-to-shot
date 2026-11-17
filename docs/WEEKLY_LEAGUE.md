# Weekly robot ratings and Discord leaderboard

The **Weekly robot leaderboard** workflow ranks every nonhidden regular file
under `robots/`, recursively, using the tested native engine. It produces separate
Elo-style ratings for head-to-head, 3-, 4-, and 5-robot battles, an overall robot
table, and leading-author standings. Friendly names and versions come from each
robot's [submission metadata](SUBMISSIONS.md).

Ratings are **recomputed from the current scripts every week**. No previous
rating or outdated version's results enter the fit. A separate durable archive
connects authors and robots across weeks, supplies movement indicators, and
produces historical leaderboards. Each weekly Discord post includes rendered
table images and a GIF of the five-way top five in a separate showcase battle.

## Enable weekly Discord delivery

This repository's Discord webhook is already configured. Existing deployments
keep using the same `DISCORD_WEBHOOK_URL` secret; the table images and GIF do not
require a new webhook or a bot account. For a fork or another channel:

1. In the intended Discord channel, open **Edit Channel → Integrations →
   Webhooks**, create a webhook, and copy its URL. Discord requires permission
   to manage webhooks in that channel.
2. In this repository's **Settings → Secrets and variables → Actions**, create
   the repository secret **`DISCORD_WEBHOOK_URL`** with that URL. Do not commit
   it or put it in workflow inputs. A webhook is sufficient; no Discord bot
   account or bot token is needed. A numeric `thread_id` query parameter is
   supported when posting to an existing thread.
3. Keep `.github/workflows/weekly-leaderboard.yml` on the default branch.
   GitHub runs scheduled workflows from that branch. Schedules require Actions
   to be enabled and can be delayed by GitHub; they are not an exact-time service.
4. For an initial check, run **Actions → Weekly robot leaderboard → Run workflow**
   on the default branch. Leave **publish** unchecked to generate standings and a
   Discord preview without sending. Check it to send a real leaderboard.

The schedule is **Monday at 00:17 UTC**, which is Monday **10:17 AEST / 11:17 AEDT**
in Melbourne. Edit the workflow's cron expression to change it. GitHub may disable
scheduled workflows in public repositories after 60 days without repository
activity; re-enable the workflow if that happens.

Pull requests and ordinary pushes generate previews without updating the history
branch or posting to Discord. Only scheduled runs and explicitly published manual
runs on the default branch can publish. The history job alone receives
`contents: write`, and it writes only the dedicated **`league-history`** data
branch. History must be saved successfully before the Discord job runs. Branch
protection or token-permission failures stop publication rather than silently
discarding history. The webhook secret is provided only to the final delivery
step. Missing secrets cause a clear delivery error; the computed leaderboard
remains available as an artifact. Forks need their own webhook secret to publish.

Invalid scripts and ambiguous metadata are listed as **unranked** with their
errors. Larger battle sizes are explicitly unavailable if too few robots compile.
If fewer than two compile, or the engine, fit, history loading, or media generation
fails, no leaderboard is posted.

The full `results.json`, compact standings, Markdown, images, GIF, showcase replay
and Discord preview are kept in an Actions run artifact for **90 days** (subject
to repository retention policy). The JSON records the ISO week, source commit,
original and normalized source hashes, engine binary hash, schedule, seeds,
execution orders, survival placements, death ticks and final-state hashes.
Durable weekly history snapshots remain on `league-history` after these artifacts
expire. Neither the archive nor the artifacts store the webhook.

Discord rate-limit responses are retried up to three times, with a maximum
30-second requested delay. Other HTTP/network errors are not automatically
retried because the message might already have arrived. Check the channel before
rerunning delivery; a manual publish or rerun can create another announcement.
Robot names cannot trigger mentions, and delivery never logs the webhook URL.

## Submission names and identities

Start with [the submission template](../templates/robot.bot). Its comment header
specifies an author, robot name and version; explicit author and robot IDs keep
those identities stable across renamed files, display-name changes, and new
versions. See [submission instructions](SUBMISSIONS.md) for syntax, encoding and
validation rules.

Only one active source file may use a given `author-id/robot-id`. If several files
claim the same robot identity, **all conflicting entries are unranked**; the league
does not guess which version is newest. All submissions sharing an author ID must
also use the same author display name within the current week. Use another robot
ID for a distinct competing robot, or replace the previous file when releasing
an updated version.

Scripts without metadata remain eligible with a filename-based name,
`unversioned` version, and **Unattributed** author. Their path-based identities
remain in robot standings and history, but they do not enter author standings.
The league does not infer authors from Git committers or directory names. Existing
model benchmark headers credit the generators named in their original comments;
the original sample files remain unchanged and unattributed.

## Reading the Discord tables

Discord does not render Markdown pipe tables as native grids. The post instead
embeds three PNGs with actual table layouts, alongside a short text summary and
complete `leaderboard.json` and `leaderboard.md` attachments:

| Attachment | Contents |
| --- | --- |
| `leaderboard-current.png` | This week's leading robots and authors, with readable names, versions, ratings, movement and battle statistics |
| `leaderboard-formats.png` | Separate head-to-head, three-way, four-way and five-way tables |
| `leaderboard-history.png` | Leading authors and robots over time, showing league points, weeks, weekly leads, best rank and last appearance |
| `showcase.gif` | The five-way top five competing in an exhibition, when at least five robots qualify |

Images show the top ten in each table; attached standings include everyone and
retain full names and paths. Current robot statistics include games, W–D–L,
win percentage, final survival percentage, and average finishing place. Tied
places use the tied group’s midrank when calculating the average. The JSON also
includes average survival ticks, average final damage and CPU-reset counts.
Overall statistics aggregate actual robot game appearances across formats;
the overall **rating** still weights formats equally.

The current author rating is the **highest overall rating among that author's
robots**. Submitting more robots does not add their ratings together. Author game
and win statistics aggregate all of their robot appearances, so two of an
author's robots in one battle count as two appearances. The table also shows how
many robots each author entered and identifies their strongest robot in the JSON.

Rank and rating movement compares stable identities with the **previous recorded
week**. A positive rank change means an improvement; a new or returning identity
absent from that prior week has no comparison. These changes describe fresh fits
in potentially different fields, rather than a carried-over Elo account.

## Authors and robots over time

Published snapshots are stored as `weeks/<ISO-week>.json` on the repository's
`league-history` branch. Each contains current robot identities, versions,
statistics, mode standings and author standings. There is **one snapshot per
week**: a rerun replaces that week's observation and cannot award another week's
points. Renaming a file or updating a version keeps its history when its stable
IDs stay unchanged. Older authors and robots remain visible with their last-seen
week even when they are no longer active.

History begins with the **first successful history publication of this workflow**.
Earlier leagues are not claimed or automatically backfilled. A preview includes
its candidate current week in the displayed historical standings but does not
save it to the data branch. A report for an older week excludes later archived
weeks from its displayed totals.

Historical leaderboards use **league points**, separately from fresh Elo-style
ratings. Every weekly robot or author standing earns a 0–100 percentile score:

```text
weekly points = 100 × (field size − tied midrank) / (field size − 1)
one-entry field = 50 points
```

An untied first place earns 100 and an untied last place earns zero. Ties receive
the points for their group's average rank; an entirely tied field gives everyone
50. Historical points sum these weekly contributions, rewarding both performance
and sustained participation. Each author contributes at most one author standing
per week regardless of how many robots they submit. The tables also show weeks
observed, first-place weeks (including shared first places), best rank and the
last-seen week. Points are not an all-time Elo estimate or a claim that scores in
different weekly fields have identical difficulty.

The history loader treats a genuinely absent data branch as the first week.
Fetch errors, corrupt snapshots, and unexpected archive files are errors, not
permission to reset history. Publication checks that the history revision used
to compute the report is still current, never force-pushes, and never modifies the
default branch. If history changes concurrently, rerun the league against the new
archive. Retrying the same publication recognizes an already-saved identical
update without making another history commit; unrelated newer history still
requires a fresh run. A Discord delivery failure does not remove a successfully
saved week.

## Weekly top-five showcase

After the league finishes, the first five rows of the **five-way standings**
enter one additional five-way battle. A tie at the selection cutoff uses the
standings' existing deterministic display order; it does not change the shared
league ranks. The showcase uses a separately derived, reproducible seed and the
same source files, engine binary and tick cap used for the league. The recorder
checks source and engine hashes before running it.

This is an **exhibition only**. Its result never contributes to robot ratings,
author ratings, historical points, or the league battle count. It stops when the
engine reports a sole survivor or reaches the configured cap, with mutual
destruction handled explicitly. A field with fewer than five eligible robots produces a
recorded skip reason instead of substituting entrants or posting an old GIF.

The new monochrome renderer follows the original game's visual style using
observed native snapshots; it does not emulate the original Mac drawing code.
It samples the complete simulated battle into at most **240 frames**, with
accelerated playback and a hold on the final state. The simulation is not cut
short to fit the animation. GIFs must remain within **4 MiB**. `showcase.json`
records the chosen robots, seed, observed frames, final state and hashes for
replay; Discord embeds `showcase.gif` with the league message.

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
same displayed tenth share rank; their deterministic identity order is only for
display, not an additional competitive tiebreak.

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
python -m pip install -r tools/requirements-league.txt
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel 2
python tests/test_robot_metadata.py --binary build/robotwar
python tests/test_weekly_league.py --binary build/robotwar
python tools/league_history_store.py load --directory build/league-history
python scripts/run_weekly_league.py --robots-dir robots \
  --week 2026-W47 --workers 2 --history-dir build/league-history \
  --media --output-dir build/weekly
```

Use a Python virtual environment for development dependencies. The media renderer
uses the pinned **Pillow 11.3.0** dependency; the native engine and Discord sender
do not require Pillow. `--media` generates the three PNGs and showcase GIF/replay.
Without it the league still computes identities, statistics and history, but
does not render media. Omit `--history-dir` for an isolated fresh-history local
preview; do not use that mode to replace the published archive.

Omit `--week` to use the current UTC ISO week. `--robots-dir` can select the whole
tree or a subdirectory. Files are UTF-8 by default; `--encoding mac-roman` accepts
original Mac text instead. Source paths relative to `robots/` remain in the JSON
for replay; readable identities come from metadata. Hidden paths are ignored;
symlinks are rejected. All nonhidden files are treated as robot sources, so keep
documentation elsewhere.

`--ticks`, `--rounds`, `--seeds` and `--workers` control local workload. Increasing
workers changes runtime only, not the schedule or result. Reproducing a league
requires its source revision, ISO week, encoding and simulation/scheduling
settings. The full JSON records all of these. Generating a local report writes
`history-week.json` beside the results but does not update the remote archive.

The protected publishing job runs the following only after computing a complete
report against the fetched history base:

```sh
python tools/league_history_store.py publish --directory build/weekly
```

That command writes to `origin/league-history`, so running it locally requires
intentional publication and repository write access. Ordinary previews should
stop after generation. The workflow persists history before posting to Discord.

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
