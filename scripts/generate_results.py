#!/usr/bin/env python3
# pip install choix numpy
from __future__ import annotations
import argparse, json, math
from collections import defaultdict
import numpy as np
import choix

def main(argv=None):
    ap = argparse.ArgumentParser(description="Bradley–Terry/Plackett–Luce rankings from results.json")
    ap.add_argument("--in", dest="inp", required=True)
    ap.add_argument("--out", dest="out", required=True)
    ap.add_argument("--center", type=float, default=1500.0)  # Elo-like center
    ap.add_argument("--scale", type=float, default=400.0)    # Elo-like spread
    args = ap.parse_args(argv)

    data = json.loads(open(args.inp, "r", encoding="utf-8").read())

    # Index robots
    robots = []
    for e in data:
        for r in (e.get("robots") or []):
            if r not in robots:
                robots.append(r)
    idx = {r:i for i,r in enumerate(robots)}
    n = len(robots)

    # Build pairwise permutations for choix and tallies
    perms = []  # each is [winner_idx, loser_idx]
    wins = defaultdict(int); games = defaultdict(int); draws = defaultdict(int)

    for e in data:
        names = e.get("robots") or []
        if len(names) < 2:
            continue
        vals = e.get("values") or {}
        gw = vals.get("games_won")
        if not (isinstance(gw, list) and len(gw) == len(names)):
            continue

        inds = [idx[name] for name in names]
        w = int(e.get("weight", 1) or 1)
        sum_wins = int(sum(int(x) for x in gw))
        nb = e.get("num_battles")
        total_games = int(nb) if isinstance(nb, int) and nb > 0 else sum_wins
        draw_count = max(total_games - sum_wins, 0)

        # Tallies for summary
        for name, w_i in zip(names, gw):
            wins[name]  += int(w_i) * w
            games[name] += total_games * w
            draws[name] += draw_count * w

        # Expand each win as winner > every other participant (pairwise)
        for i, w_i in enumerate(gw):
            wi = int(w_i) * w
            if wi <= 0:
                continue
            for j in range(len(inds)):
                if j == i:
                    continue
                perms += [[inds[i], inds[j]]] * wi

        # Add symmetric, cancelling observations for draws (no effect on fit, keeps obs count consistent)
        if draw_count > 0:
            for i in range(len(inds)):
                for j in range(i+1, len(inds)):
                    perms += [[inds[i], inds[j]]] * (draw_count * w)
                    perms += [[inds[j], inds[i]]] * (draw_count * w)

    if not perms:
        raise SystemExit("No usable observations found in results.json")

    # Fit Plackett–Luce via ILSR (order-invariant)
    strength = choix.ilsr_pairwise(n_items=n, data=perms, alpha=0.01, max_iter=10000)

    # Map to Elo-like ratings, handling both utilities (can be negative) and positive weights
    s = np.asarray(strength, dtype=float)
    s = np.nan_to_num(s, nan=0.0, posinf=0.0, neginf=0.0)

    if np.any(s <= 0):
        # Treat solver output as utilities x \in ℝ.  PL weights are proportional to exp(x).
        # rating = center + scale * log10( exp(x) / geometric_mean(exp(x)) )
        #        = center + (scale / ln(10)) * (x - mean(x))
        rating = (args.center + (args.scale / math.log(10.0)) * (s - s.mean())).tolist()
    else:
        # Already positive weights: use the geometric-mean centering as before.
        geo = math.exp(np.mean(np.log(s)))
        rating = (args.center + args.scale * np.log10(s / geo)).tolist()

    players = []
    for i, name in enumerate(robots):
        g = games[name]; w_ = wins[name]; d_ = draws[name]
        players.append({
            "name": name,
            "rating": round(rating[i], 2),
            "wins": int(w_),
            "losses": int(g - w_ - d_),
            "draws": int(d_),
            "games": int(g)
        })
    players.sort(key=lambda x: (-x["rating"], x["name"].lower()))

    out = {"observations": len(perms), "robots": players}
    with open(args.out, "w", encoding="utf-8") as f:
        json.dump(out, f, ensure_ascii=False, indent=2)

    print(f"Wrote {args.out} with {len(players)} robots (obs={len(perms)})")

if __name__ == "__main__":
    raise SystemExit(main())
