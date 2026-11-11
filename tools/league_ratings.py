"""Balanced multiplayer schedules and an order-independent Elo-scale fit.

Ratings fit Bradley–Terry pairwise scores, with each battle contributing one
unit of evidence per entrant. Two drawn virtual games against a fixed 1500
reference regularize every robot, including robots that never lose.
"""
from __future__ import annotations

from collections import Counter, defaultdict
import hashlib
import itertools
import json
import math


def digest(*parts) -> bytes:
    return hashlib.sha256(json.dumps(parts, ensure_ascii=True, separators=(",", ":")).encode()).digest()


def schedule(ids: list[str], size: int, week: str, *, rounds=4, seeds=2,
             minimum_games=32, exhaustive_limit=128) -> dict:
    """Exhaustive small fields; balanced circular windows for larger fields.

    Every circular round gives every entrant exactly `size` group appearances.
    A connected opponent graph and no byes follow from the overlapping windows.
    Eight deterministic candidate circles minimize repeated opponent exposure.
    Rotating every group through all seats then balances engine execution order.
    """
    ids = sorted(ids)
    if len(ids) != len(set(ids)) or not 2 <= size <= min(5, len(ids)):
        raise ValueError("A schedule needs unique entrants and a supported battle size")
    if min(rounds, seeds, minimum_games, exhaustive_limit) < 1:
        raise ValueError("Schedule budgets must be positive")
    if math.comb(len(ids), size) <= exhaustive_limit:
        groups = list(itertools.combinations(ids, size))
        appearances = math.comb(len(ids) - 1, size - 1)
        method = "exhaustive"
    else:
        groups, seen = [], Counter()
        for number in range(rounds):
            candidates = []
            for candidate in range(8):
                circle = sorted(ids, key=lambda name: digest(week, size, number, candidate, name))
                proposed = [tuple(circle[(start + offset) % len(ids)] for offset in range(size))
                            for start in range(len(ids))]
                pairs = Counter(pair for group in proposed
                                for pair in itertools.combinations(sorted(group), 2))
                score = (max(seen[pair] + count for pair, count in pairs.items()),
                         sum((seen[pair] + count) ** 2 - seen[pair] ** 2
                             for pair, count in pairs.items()), candidate)
                candidates.append((score, proposed, pairs))
            _, proposed, pairs = min(candidates, key=lambda value: value[0])
            groups.extend(proposed)
            seen.update(pairs)
        appearances = size * rounds
        method = "balanced-circles"
    blocks = max(seeds, math.ceil(minimum_games / (appearances * size)))
    return {"size": size, "method": method, "groups": [list(group) for group in groups],
            "seed_blocks": blocks, "games_per_robot": appearances * size * blocks,
            "battle_count": len(groups) * size * blocks}


def seed_for(week: str, size: int, block: int, phase: int = 0) -> int:
    # Shared within a mode/round/block. New circles get fresh seeds so repeated
    # groups do not replay identical games. Excludes degenerate ROM seeds.
    return 1 + int.from_bytes(digest("league-v1", week, size, phase, block)[:8], "big") % 0x7FFFFFFE


def fit_ratings(ids: list[str], games: list[dict]) -> list[dict]:
    """Fit normalized pairwise survival placements; no game-order dependence.

    Damped Newton steps solve the regularized Bradley–Terry likelihood.
    A tie contributes half a win. Comparisons in a k-player battle have weight
    1/(k-1); they are correlated evidence, not k-1 independent full games.
    """
    ids = sorted(ids)
    index = {name: i for i, name in enumerate(ids)}
    wins = [1.0] * len(ids)  # Two virtual draws versus fixed strength 1.
    neighbors = [defaultdict(float) for _ in ids]
    statistics = {name: {"games": 0, "wins": 0, "draws": 0, "losses": 0,
                         "opponents": set()} for name in ids}
    # Sorting is also necessary for identical floating-point accumulation when
    # parallel results arrive in a different order.
    for game in sorted(games, key=lambda item: (tuple(item["order"]), item["seed"])):
        order, ranks = game["order"], game["ranks"]
        if not 2 <= len(order) <= 5 or len(order) != len(set(order)) or len(ranks) != len(order):
            raise ValueError("Malformed ranked battle")
        if any(name not in index for name in order):
            raise ValueError("Battle contains an unknown entrant")
        weight = 1.0 / (len(order) - 1)
        for position, name in enumerate(order):
            stats = statistics[name]
            stats["games"] += 1
            stats["opponents"].update(set(order) - {name})
            if game["winner"] == name:
                stats["wins"] += 1
            elif game["winner"] is None:
                stats["draws"] += 1
            else:
                stats["losses"] += 1
            for other in range(position + 1, len(order)):
                a, b = index[name], index[order[other]]
                score = 0.5 if ranks[position] == ranks[other] else float(ranks[position] < ranks[other])
                wins[a] += weight * score
                wins[b] += weight * (1 - score)
                neighbors[a][b] += weight
                neighbors[b][a] += weight
    utilities = _fit(wins, neighbors)
    rows = []
    for i, name in enumerate(ids):
        stats = statistics[name]
        rows.append({"id": name, "rating": round(1500 + 400 * utilities[i] / math.log(10), 1),
                     **{key: value for key, value in stats.items() if key != "opponents"},
                     "opponents": len(stats["opponents"]),
                     "provisional": stats["games"] < 32 or len(stats["opponents"]) < min(5, len(ids) - 1)})
    return ranked(rows)


def _fit(wins, neighbors):
    """Sparse Newton/conjugate-gradient solver with an Armijo line search.

    The reference prior makes the Hessian positive definite. Its matrix-vector
    product is a weighted graph Laplacian plus a positive diagonal, so no dense
    N-by-N matrix or third-party numerical package is needed. Working in log
    strengths avoids overflow and the slow convergence of multiplicative fits
    on strongly separated populations.
    """
    size = len(wins)
    edges = [(i, j, weight) for i, adjacent in enumerate(neighbors)
             for j, weight in sorted(adjacent.items()) if i < j]

    def logistic(value):
        small = math.exp(-abs(value))
        probability = 1 / (1 + small) if value >= 0 else small / (1 + small)
        return probability, small / (1 + small) ** 2

    def log_sum_exp(left, right):
        return max(left, right) + math.log1p(math.exp(-abs(left - right)))

    def objective(values):
        return math.fsum([2 * log_sum_exp(value, 0) - wins[i] * value
                          for i, value in enumerate(values)] +
                         [weight * log_sum_exp(values[i], values[j]) for i, j, weight in edges])

    values = [0.0] * size
    for _ in range(100):
        gradient, anchor = [], []
        for i, value in enumerate(values):
            probability, curvature = logistic(value)
            gradient.append(2 * probability - wins[i])
            anchor.append(2 * curvature)
        diagonal, curvature_edges = list(anchor), []
        for i, j, weight in edges:
            probability, curvature = logistic(values[i] - values[j])
            gradient[i] += weight * probability
            gradient[j] += weight * (1 - probability)
            curvature *= weight
            diagonal[i] += curvature
            diagonal[j] += curvature
            curvature_edges.append((i, j, curvature))
        if max(map(abs, gradient), default=0) < 1e-8:
            return values

        def product(vector):
            result = [anchor[i] * vector[i] for i in range(size)]
            for i, j, curvature in curvature_edges:
                flow = curvature * (vector[i] - vector[j])
                result[i] += flow
                result[j] -= flow
            return result

        dot = lambda left, right: math.fsum(a * b for a, b in zip(left, right))
        change, residual = [0.0] * size, [-value for value in gradient]
        preconditioned = [residual[i] / diagonal[i] for i in range(size)]
        direction = list(preconditioned)
        magnitude = dot(residual, preconditioned)
        tolerance = max(1e-24, dot(gradient, gradient) * 1e-8)
        for _ in range(max(1, 4 * size)):
            transformed = product(direction)
            denominator = dot(direction, transformed)
            if denominator <= 0:
                raise RuntimeError("Rating Hessian lost positive definiteness")
            step = magnitude / denominator
            change = [change[i] + step * direction[i] for i in range(size)]
            residual = [residual[i] - step * transformed[i] for i in range(size)]
            if dot(residual, residual) <= tolerance:
                break
            preconditioned = [residual[i] / diagonal[i] for i in range(size)]
            next_magnitude = dot(residual, preconditioned)
            direction = [preconditioned[i] + (next_magnitude / magnitude) * direction[i]
                         for i in range(size)]
            magnitude = next_magnitude
        else:
            raise RuntimeError("Rating Newton step did not converge")
        previous, slope, step = objective(values), dot(gradient, change), 1.0
        if slope >= 0:
            raise RuntimeError("Rating Newton step is not a descent direction")
        for _ in range(40):
            proposed = [values[i] + step * change[i] for i in range(size)]
            # Permit roundoff at the last Newton step; convergence still requires
            # the independent gradient residual check on the next iteration.
            if objective(proposed) <= previous + 1e-4 * step * slope + 1e-12:
                values = proposed
                break
            step *= 0.5
        else:
            raise RuntimeError("Rating line search did not converge")
    raise RuntimeError("Rating fit did not converge; refusing to publish unconverged ratings")


def ranked(rows: list[dict]) -> list[dict]:
    """Displayed ratings determine shared ranks; names only order tied rows."""
    rows = sorted(rows, key=lambda row: (-row["rating"], row["id"]))
    previous, rank = None, 0
    for position, row in enumerate(rows, 1):
        if row["rating"] != previous:
            rank = position
        previous = row["rating"]
        row["rank"] = rank
    return rows
