#!/usr/bin/env python3
"""Deterministic tournament schedules and exact standings, without game execution.

``games_per_pair`` is the fixed number of games in every played series. Results
use doubled points: win=2, draw=1, loss=0. Display points use the conventional
win=1 scale. Swiss byes award a neutral drawn series but do not invent games,
wins, draws, or opponents. Round-robin byes award no points.

Swiss pairing first finds a maximum matching using only unused opponents. Any
remaining vertices must meet previously played opponents, and their number
proves the minimum possible repeat count conditional on the selected bye.
Edmonds' blossom contraction makes
this exact for general graphs; its work is polynomial, with no search cutoff.
Within that constraint, adjacency lists prefer neighboring scores and then a
seeded priority. This preference does not claim globally minimum score gaps.

Standings use exact Fraction arithmetic. Opponent averages count played series
occurrences, including rematches, and exclude byes. Seeded priority never breaks
a competitive tie; it only orders tied rows and schedules participants.
"""
from __future__ import annotations

from collections import deque
from copy import deepcopy
from dataclasses import dataclass, field
from fractions import Fraction
import hashlib
from typing import Iterable


def _maximum_matching(neighbors: list[list[int]]) -> list[int]:
    """Maximum-cardinality matching in an undirected graph, O(V**3).

    Vertices and each neighbor list are already in the caller's preference
    order. The greedy start handles the usual dense Swiss graph cheaply;
    alternating-path searches and blossom contraction repair blocked matches.
    Return the partner index or -1 for each vertex.
    """
    size = len(neighbors)
    partner = [-1] * size
    for vertex in range(size):
        if partner[vertex] < 0:
            for other in neighbors[vertex]:
                if partner[other] < 0:
                    partner[vertex], partner[other] = other, vertex
                    break

    def augment(root: int) -> bool:
        parent = [-1] * size
        base = list(range(size))
        visited = [False] * size
        queue = deque([root])
        visited[root] = True

        def common_base(left: int, right: int) -> int:
            ancestors = [False] * size
            while True:
                left = base[left]
                ancestors[left] = True
                if partner[left] < 0:
                    break
                left = parent[partner[left]]
            while not ancestors[base[right]]:
                right = parent[partner[base[right]]]
            return base[right]

        def mark_branch(vertex: int, common: int, child: int,
                        contracted: list[bool]) -> None:
            while base[vertex] != common:
                contracted[base[vertex]] = True
                contracted[base[partner[vertex]]] = True
                parent[vertex] = child
                child = partner[vertex]
                vertex = parent[partner[vertex]]

        while queue:
            vertex = queue.popleft()
            for other in neighbors[vertex]:
                if base[vertex] == base[other] or partner[vertex] == other:
                    continue
                if other == root or (partner[other] >= 0 and parent[partner[other]] >= 0):
                    common = common_base(vertex, other)
                    contracted = [False] * size
                    mark_branch(vertex, common, other, contracted)
                    mark_branch(other, common, vertex, contracted)
                    for member in range(size):
                        if contracted[base[member]]:
                            base[member] = common
                            if not visited[member]:
                                visited[member] = True
                                queue.append(member)
                elif parent[other] < 0:
                    parent[other] = vertex
                    if partner[other] < 0:
                        # Flip the alternating path, increasing cardinality by one.
                        end = other
                        while end >= 0:
                            previous = parent[end]
                            following = partner[previous]
                            partner[end], partner[previous] = previous, end
                            end = following
                        return True
                    matched = partner[other]
                    visited[matched] = True
                    queue.append(matched)
        return False

    for vertex in range(size):
        if partner[vertex] < 0:
            augment(vertex)
    return partner


@dataclass
class _Score:
    points: int = 0  # doubled points
    wins: int = 0
    draws: int = 0
    losses: int = 0
    byes: int = 0
    opponents: list[tuple[str, int]] = field(default_factory=list)


class TournamentFormat:
    """Schedule a fixed participant list and record complete pair series.

    Call next_round(), record_pair() once per scheduled pair, then finish_round().
    Recording is transactional at round granularity: standings change only when
    finish_round() has validated that every pair supplied a complete result.
    next_round() returns None when the schedule is complete.
    """

    def __init__(self, ids: Iterable[str], seed: int, games_per_pair: int,
                 format: str = "auto", rounds: int = 0):
        if isinstance(ids, (str, bytes)):
            raise ValueError("participants must be an iterable of distinct string IDs")
        participants = list(ids)
        if len(participants) < 2 or any(not isinstance(x, str) or not x for x in participants):
            raise ValueError("a tournament needs at least two nonempty string participant IDs")
        if len(set(participants)) != len(participants):
            raise ValueError("participant IDs must be distinct")
        if type(seed) is not int:
            raise ValueError("seed must be an integer")
        if type(games_per_pair) is not int or games_per_pair < 1:
            raise ValueError("games_per_pair must be a positive integer")
        if type(rounds) is not int or rounds < 0:
            raise ValueError("rounds must be zero or a positive integer")
        if format not in ("auto", "round-robin", "swiss"):
            raise ValueError("format must be auto, round-robin, or swiss")
        self.ids = tuple(sorted(participants))
        self.seed = seed
        self.games_per_pair = games_per_pair
        self.format = ("round-robin" if len(self.ids) <= 16 else "swiss") if format == "auto" else format
        if self.format == "round-robin":
            if rounds:
                raise ValueError("round-robin always plays every pair; rounds must be zero")
            self.rounds = len(self.ids) - 1 + len(self.ids) % 2
        else:
            if rounds > len(self.ids) - 1:
                raise ValueError("Swiss rounds must be between one and participant count minus one")
            self.rounds = rounds or min(len(self.ids) - 1, 2 * (len(self.ids) - 1).bit_length() + 1)
            if len(self.ids) % 2 and self.rounds < 2:
                raise ValueError("Odd-sized Swiss fields need at least two rounds so every robot plays")
        priority_tag = b"robotwar-tournament-priority-v1\0" + str(seed).encode("ascii") + b"\0"
        ordered = sorted(self.ids, key=lambda participant: (
            hashlib.sha256(priority_tag + participant.encode("utf-8")).digest(), participant))
        self._priority = {participant: index for index, participant in enumerate(ordered)}
        self._circle = ordered + ([None] if len(ordered) % 2 else [])
        self._scores = {participant: _Score() for participant in self.ids}
        self._played = {participant: set() for participant in self.ids}
        self.completed_rounds = 0
        self.history: list[dict] = []
        self._pending: dict | None = None
        self._results: dict[frozenset[str], dict] = {}

    def _swiss_pairs(self, participants: list[str]) -> tuple[list[tuple[str, str]], int]:
        participants.sort(key=lambda x: (-self._scores[x].points, self._priority[x]))
        neighbors = []
        for participant in participants:
            candidates = [index for index, other in enumerate(participants)
                          if other != participant and other not in self._played[participant]]
            candidates.sort(key=lambda index: (
                abs(self._scores[participant].points - self._scores[participants[index]].points),
                self._priority[participants[index]]))
            neighbors.append(candidates)
        matching = _maximum_matching(neighbors)
        pairs = [(participants[index], participants[other])
                 for index, other in enumerate(matching) if other > index]
        unmatched = [participants[index] for index, other in enumerate(matching) if other < 0]
        repeats = len(unmatched) // 2
        # The unmatched vertices have no unused edges between them: otherwise
        # the maximum matching could be extended. Pair score neighbors here.
        pairs.extend(zip(unmatched[::2], unmatched[1::2]))
        pairs.sort(key=lambda pair: (
            -max(self._scores[pair[0]].points, self._scores[pair[1]].points),
            min(self._priority[pair[0]], self._priority[pair[1]])))
        return pairs, repeats

    def next_round(self) -> dict | None:
        if self._pending is not None:
            raise ValueError("finish the pending round before requesting another")
        if self.completed_rounds == self.rounds:
            return None
        bye = None
        if self.format == "round-robin":
            pairs = []
            for index in range(len(self._circle) // 2):
                left, right = self._circle[index], self._circle[-1 - index]
                if left is None or right is None:
                    bye = right if left is None else left
                else:
                    pairs.append((left, right))
            minimum_repeats = 0
        else:
            participants = list(self.ids)
            if len(participants) % 2:
                bye = min(participants, key=lambda x: (
                    self._scores[x].byes, self._scores[x].points, self._priority[x]))
                participants.remove(bye)
            pairs, minimum_repeats = self._swiss_pairs(participants)
        repeat_pairs = [pair for pair in pairs if pair[1] in self._played[pair[0]]]
        if len(repeat_pairs) != minimum_repeats:
            raise RuntimeError("matching failed its minimum-repeat invariant")
        self._pending = {"number": self.completed_rounds + 1, "pairs": pairs,
                         "bye": bye, "repeat_pairs": repeat_pairs,
                         "minimum_repeats": minimum_repeats}
        self._results = {}
        return deepcopy(self._pending)

    def record_pair(self, a: str, b: str, points_a: int, points_b: int,
                    wins_a: int, wins_b: int, draws: int) -> None:
        if self._pending is None:
            raise ValueError("request a round before recording results")
        key = frozenset((a, b))
        scheduled = {frozenset(pair) for pair in self._pending["pairs"]}
        if a == b or key not in scheduled:
            raise ValueError("pair is not scheduled in the pending round")
        if key in self._results:
            raise ValueError("pair already has a recorded result")
        values = (points_a, points_b, wins_a, wins_b, draws)
        if any(type(value) is not int or value < 0 for value in values):
            raise ValueError("result counts and doubled points must be nonnegative integers")
        if wins_a + wins_b + draws != self.games_per_pair:
            raise ValueError("result must account for every game in the series")
        if points_a != 2 * wins_a + draws or points_b != 2 * wins_b + draws:
            raise ValueError("doubled points must equal two per win plus one per draw")
        self._results[key] = {"a": a, "b": b, "points_a": points_a, "points_b": points_b,
                              "wins_a": wins_a, "wins_b": wins_b, "draws": draws}

    def finish_round(self) -> dict:
        if self._pending is None:
            raise ValueError("there is no pending round")
        if len(self._results) != len(self._pending["pairs"]):
            raise ValueError("every scheduled pair needs a result before finishing the round")
        results = []
        for pair in self._pending["pairs"]:
            result = self._results[frozenset(pair)]
            a, b = result["a"], result["b"]
            for participant, other, points, wins, losses in (
                (a, b, result["points_a"], result["wins_a"], result["wins_b"]),
                (b, a, result["points_b"], result["wins_b"], result["wins_a"]),
            ):
                score = self._scores[participant]
                score.points += points
                score.wins += wins
                score.losses += losses
                score.draws += result["draws"]
                score.opponents.append((other, points))
                self._played[participant].add(other)
            results.append(dict(result))
        bye = self._pending["bye"]
        if bye is not None:
            self._scores[bye].byes += 1
            if self.format == "swiss":
                self._scores[bye].points += self.games_per_pair
        summary = {**deepcopy(self._pending), "results": results}
        self.history.append(summary)
        self.completed_rounds += 1
        if self.format == "round-robin":
            self._circle = [self._circle[0], self._circle[-1], *self._circle[1:-1]]
        self._pending, self._results = None, {}
        return deepcopy(summary)

    def _tie_key(self, participant: str) -> tuple[int, Fraction, Fraction]:
        score = self._scores[participant]
        if not score.opponents:
            return score.points, Fraction(0), Fraction(0)
        average = Fraction(sum(self._scores[other].points for other, _ in score.opponents),
                           len(score.opponents))
        weighted = sum((Fraction(self._scores[other].points * earned,
                                 2 * self.games_per_pair)
                        for other, earned in score.opponents), Fraction(0)) / len(score.opponents)
        return score.points, average, weighted

    def standings(self) -> list[dict]:
        metrics = {participant: self._tie_key(participant) for participant in self.ids}
        ordered = sorted(self.ids, key=lambda x: (
            -metrics[x][0], -metrics[x][1], -metrics[x][2], self._priority[x]))
        rows = []
        previous = None
        rank = 0
        for index, participant in enumerate(ordered, 1):
            metric = metrics[participant]
            if metric != previous:
                rank = index
            previous = metric
            score = self._scores[participant]
            average, weighted = metric[1] / 2, metric[2] / 2
            rows.append({
                "id": participant, "rank": rank,
                "points": score.points / 2, "points_twice": score.points,
                "wins": score.wins, "draws": score.draws, "losses": score.losses,
                "played_games": score.wins + score.draws + score.losses,
                "byes": score.byes, "opponents": [other for other, _ in score.opponents],
                "opponent_average": float(average),
                "opponent_average_exact": f"{average.numerator}/{average.denominator}",
                "weighted_opponent_average": float(weighted),
                "weighted_opponent_average_exact": f"{weighted.numerator}/{weighted.denominator}",
                "champion": rank == 1,
            })
        return rows

    def champions(self) -> list[str]:
        return [row["id"] for row in self.standings() if row["rank"] == 1]
