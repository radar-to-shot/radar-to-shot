#!/usr/bin/env python3
"""
Input JSON schema (e.g. battles.json):
{
  "battles": [
    { "robots": ["examples/Chicken", "examples/Seeker"], "num_battles": 5 },
    { "robots": ["examples/Wall Crawler", "examples/Run Away"], "num_battles": 10 }
  ]
}
"""
from __future__ import annotations

import argparse, glob, hashlib, json, os, re
from typing import Any, Dict, List, Optional, Tuple

import numpy as np
from PIL import Image

DIGIT_0 = np.array([
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]], dtype=np.uint8)
DIGIT_1 = np.array([
    [0, 0, 1, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0]], dtype=np.uint8)
DIGIT_2 = np.array([
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0],
    [1, 1, 1, 1, 1]], dtype=np.uint8)
DIGIT_3 = np.array([
    [1, 1, 1, 1, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]], dtype=np.uint8)
DIGIT_4 = np.array([
    [0, 0, 0, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 1, 0, 1, 0],
    [1, 0, 0, 1, 0],
    [1, 1, 1, 1, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0]], dtype=np.uint8)
DIGIT_5 = np.array([
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]], dtype=np.uint8)
DIGIT_6 = np.array([
    [0, 0, 1, 1, 0],
    [0, 1, 0, 0, 0],
    [1, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]], dtype=np.uint8)
DIGIT_7 = np.array([
    [1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0]], dtype=np.uint8)
DIGIT_8 = np.array([
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0]], dtype=np.uint8)
DIGIT_9 = np.array([
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 1, 1, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 1, 0],
    [0, 1, 1, 0, 0]], dtype=np.uint8)

DIGITS_5x7 = {'0': DIGIT_0, '1': DIGIT_1, '2': DIGIT_2, '3': DIGIT_3, '4': DIGIT_4, '5': DIGIT_5, '6': DIGIT_6, '7': DIGIT_7, '8': DIGIT_8, '9': DIGIT_9}

ROW_KEYS: List[str] = [
    "games_won",
    "shot_damage_to_others",
    "avg_damage_sustained",
    "shot_damage_to_self",
    "collision_damage",
    "times_out_of_fuel",
    "cpu_error_resets",
]

# Row centers as fractions of height (266 px).
ROW_Y_FRAC: List[float] = [0.432, 0.515, 0.598, 0.680, 0.763, 0.846, 0.929]

# Column centers as fractions of width (384 px).
COL_X_FRAC = [0.357, 0.503, 0.649, 0.794, 0.940]

# Cell crop size and padding
CELL_W_FRAC = 0.141   # 54 px
CELL_H_FRAC = 0.075   # 20 px

def battle_label(b: Dict[str, Any]) -> str:
    return hashlib.sha256(json.dumps(b).encode("ascii")).hexdigest()[:8]

def load_battle_index(path: str) -> Dict[str, Dict[str, Any]]:
    with open(path, "r", encoding="utf-8") as f:
        obj = json.load(f)
    return {battle_label(b): b for b in obj.get("battles", [])}

def load_gray(path: str) -> np.ndarray:
    return np.array(Image.open(path).convert("L"), dtype=np.uint8)

def binarize(gray: np.ndarray, thr: int = 128) -> np.ndarray:
    # black ink -> 1, white -> 0
    return (gray < thr).astype(np.uint8)

def xcorr2d_exact(cell01: np.ndarray, tpl01: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    """
    Cross-correlation via sliding windows (no normalization):
      score(y,x) = sum(cell * tpl)
    Also return the window sum so we can enforce exact match:
      exact iff score == tpl.sum() and window_sum == tpl.sum()
    """
    H, W = cell01.shape
    h, w = tpl01.shape
    if H < h or W < w:
        return np.zeros((0, 0), dtype=np.int32), np.zeros((0, 0), dtype=np.int32)
    s = cell01.strides
    shape = (H - h + 1, W - w + 1, h, w)
    patches = np.lib.stride_tricks.as_strided(cell01, shape=shape, strides=s + s, writeable=False)
    scores = (patches * tpl01).sum(axis=(2, 3))
    wndsum = patches.sum(axis=(2, 3))
    return scores, wndsum

def find_digits(cell01: np.ndarray) -> List[Tuple[int, int, str]]:
    """
    Return [(x, y, ch), ...] for exact 5x7 matches in the cell.
    Enforce exactness: sum(cell*tpl) == sum(tpl) == sum(cell_window)
    """
    hits: List[Tuple[int, int, str]] = []
    for ch, tpl in DIGITS_5x7.items():
        tpl01 = tpl.astype(np.uint8)
        tsum = int(tpl01.sum())
        scores, wndsum = xcorr2d_exact(cell01, tpl01)
        if scores.size == 0:
            continue
        mask = (scores == tsum) & (wndsum == tsum)
        ys, xs = np.nonzero(mask)
        for y, x in zip(ys.tolist(), xs.tolist()):
            hits.append((x, y, ch))
    # Greedy non-overlap by x (5px glyph width)
    hits.sort(key=lambda t: (t[1], t[0]))
    filtered: List[Tuple[int, int, str]] = []
    last_x = -999
    for x, y, ch in sorted(hits, key=lambda t: t[0]):
        if x - last_x >= 5:  # disallow overlap
            filtered.append((x, y, ch))
            last_x = x
    return filtered

def read_int(pil_img_or_np: Image.Image | np.ndarray) -> Optional[int]:
    arr = np.array(pil_img_or_np, dtype=np.uint8)
    if arr.ndim == 3:
        arr = np.array(Image.fromarray(arr).convert("L"))
    cell01 = binarize(arr)
    hits = find_digits(cell01)
    if not hits:
        return None
    # left-to-right concatenation
    digits = "".join(ch for _, _, ch in sorted(hits, key=lambda t: t[0]))
    try:
        return int(digits)
    except ValueError:
        return None

def parse_image(path: str, robots: List[str], num_battles: Optional[int]) -> Dict[str, Any]:
    gray = load_gray(path)
    if gray.size == 0:
        return {"source_image": os.path.basename(path), "error": "open failed"}

    height, width = gray.shape
    ncols = max(2, min(5, len(robots)))

    row_ys = [int(f * height) for f in ROW_Y_FRAC]
    col_xs = [int(f * width) for f in COL_X_FRAC[0:ncols]]
    w = max(18, int(CELL_W_FRAC * width))
    h = max(14, int(CELL_H_FRAC * height))

    table: Dict[str, List[Optional[int]]] = {k: [] for k in ROW_KEYS}
    for ri, y in enumerate(row_ys):
        for x in col_xs:
            x1, x2 = max(0, x - w // 2), min(width, x + w // 2)
            y1, y2 = max(0, y - h // 2), min(height, y + h // 2)
            cell = gray[y1:y2, x1:x2]
            val = read_int(cell)
            table[ROW_KEYS[ri]].append(val)

    return {
        "source_image": os.path.basename(path),
        "robots": [r.split("/")[-1] for r in robots],
        "num_battles": num_battles,
        "values": table,
    }

def main() -> None:
    parser = argparse.ArgumentParser(description="Battle results OCR")
    parser.add_argument("image_dir", help="Folder containing result PNGs")
    parser.add_argument("-i", "--battles-json", required=True, help="JSON with {'battles': [{'robots': [...],'num_battles': N}, ...]}")
    parser.add_argument("-o", "--output", default="results.json")
    args = parser.parse_args()

    idx = load_battle_index(args.battles_json)

    results: List[Dict[str, Any]] = []
    overlays: List[str] = []
    for img_path in sorted(glob.glob(os.path.join(args.image_dir, "*.png"))):
        m = re.search(r"Battle Results - ([0-9a-f]{8})", os.path.basename(img_path))
        label = m.group(1) if m else None
        battle = idx.get(label) if label else None
        robots = (battle or {}).get("robots", []) or []
        num_battles = (battle or {}).get("num_battles", None)
        results.append(parse_image(img_path, robots, num_battles))

    with open(args.output, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    print(f"Wrote {args.output} ({len(results)} images).")

if __name__ == "__main__":
    main()
