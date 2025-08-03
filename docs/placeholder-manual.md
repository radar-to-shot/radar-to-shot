# Robot Warrior (1991) — Beginner’s Guide to Robot Programming (Inferred)

*Based on sample robots: Wall Crawler, Run Away, Circle Shooter, Chicken, Seeker.*

This beginner-friendly guide explains the robot language used by **Robot Warrior**. It is reconstructed from examples, so a few details are inferred rather than confirmed. Where something is uncertain, we’ll point it out and suggest a safe default.

---

## 1) What You’re Building

A robot is a small program that senses the arena, moves, and fires. You don’t control the robot directly; you write rules it follows every **tick** (a small slice of time). Your program is plain text with two parts:

1) **Hardware attributes** at the top (what gear your robot has).  
2) **Code** below (the behavior).

---

## 2) Hardware Attributes (top of file)

Each attribute is an integer. Unless noted, values range **0–3** (higher usually means better or faster).

- **CPU_SPEED (0–3)** — How many instructions your robot can run per tick.  
- **ARMOR (0–3)** — How much damage you can take.  
- **FIRE_RATE (0–3)** — How quickly the gun becomes ready again.  
- **ENGINE_SIZE (0–3)** — Acceleration and maximum speed.  
- **RADAR_RANGE (0–3)** — How far/strong your radar scans.  
- **CLOAKING (0 or 1)** — Whether you have a cloaking device.  
- **FUEL_CAPACITY (0–3)** — How much cloak fuel you carry.  

You have a total of 6 points you can spend, so choose wisely.

---

## 3) Angles & the Arena

- Angles use degrees with **0° pointing UP** (north).  
  - 90° is RIGHT (east)  
  - 180° is DOWN (south)  
  - 270° is LEFT (west)
- The arena has coordinates `(x, y)`. You can read your position with `x` and `y`.  
- The maximum bounds are `XMAX` and `YMAX` (the far edges of the arena).

---

## 4) Your First File: Shape of a Program

A program starts with attributes, then constants and variables, then the main loop and any helper routines.

```text
CPU_SPEED   2
ARMOR       2
FIRE_RATE   2
ENGINE_SIZE 2
RADAR_RANGE 2
CLOAKING    1
FUEL_CAPACITY 2

define TRUE 1
define FALSE 0
define SAFETY 40

allocate aim, oldDamage, cloak

; Install a tiny time interrupt (optional)
TickISR to time_int_xfer
1 to time_int_mask

; Main loop
Main
    maxSpeed to speed
    repeat
        ; Sweep and scan
        aim + 10 to aim to radar
        if radar > 0 then
            if shot > 0 then
                radar/10 + radar to shot
            end
        end
    until FALSE
goto Main

TickISR
    if cloak > 0 then cloak - 1 to cloak
endint
```

---

## 5) Core Building Blocks (Plain English)

- **Assignment** — “Put a value into a box.”  
  - Example: `20 to speed` sets your speed to 20.  
  - You can **chain**: `expr to A to B` stores the same value into both `A` and `B`.
- **If / Else** — “Only do something when a condition is true.”  
  - Example: `if radar > 0 then ... end`.
- **Loops** — “Keep doing something.”  
  - `while cond do ... end` or `repeat ... until cond`.
- **Subroutines** — “Give a name to a chunk of steps.”  
  - `gosub label` and finish with `return`. Use `goto label` for an unconditional jump.
- **Comments** — Anything after `;` on a line is **just a note** to yourself, not code.
- **Comparators** — `=`, `<>`, `<`, `<=`, `>`, `>=`.
- **Math seen** — `+`, `-`, `*`, `/`. (Left-to-right operator precedence)

---

## 6) Scanning & Shooting

To look for enemies, move the radar and ask for a reading. You do that by **assigning an angle to `radar`**. If a target is detected, `radar` returns a **positive distance**. Many robots sweep by increasing `aim` and scanning each step.

```text
; Step the beam and scan
aim + 10 to aim to radar

; Check if we saw anything
if radar > 0 then
    ; Only fire if the gun is ready
    if shot > 0 then
        radar/10 + radar to shot   ; simple leading shot (~10% extra)
    end
end
```

**Rules of thumb**  
1) Treat `radar > 0` as “I see someone.” The value behaves like distance.  
2) Treat `shot > 0` as “the gun is ready.” Only write to `shot` when ready.  

> Optional finesse: Some examples nudge `aim` before firing, e.g., `300/radar + aim - 1 to aim`, to compensate for movement.

---

## 7) Moving and Avoiding Walls

Set your heading with `direction` and your speed with `speed`. `maxSpeed` is a handy read-only value for your top speed.

```text
maxSpeed to speed
90 to direction   ; face right

; Simple safety bubble around the edges
if x < SAFETY or x + SAFETY > XMAX or y < SAFETY or y + SAFETY > YMAX then
    direction + 15 to direction   ; nudge away from the wall
end
```

---

## 8) Cloaking (Optional Hardware)

If you declared `CLOAKING 1`, you can engage a cloak by setting a **countdown number** (how long to stay cloaked). A **time interrupt** usually decrements it. Cloaking consumes `fuel`, so be conservative when fuel is low.

```text
if damage <> oldDamage then
    5 to cloak       ; briefly cloak on new damage
    damage to oldDamage
end
```

---

## 9) Time Interrupts (Little Background Helper)

A **time interrupt** is a tiny helper that runs automatically every tick—great for short, repeated jobs. Keep it short. Typical jobs: rotate a bit, decrement cloak, count time.

```text
MyISR to time_int_xfer
1 to time_int_mask

MyISR
    direction + 6 to direction  ; slow spin
    if cloak > 0 then cloak - 1 to cloak
endint
```

---

## 10) Common Mistakes & Safe Defaults

- **Forgetting gun readiness** — Only write to `shot` when `shot > 0`.  
- **Angles reversed** — Remember **0° is UP**, not right.  
- **Radar clobbering** — If you also scan in the interrupt, consider a simple flag to avoid overwriting a main-loop reading.  
- **Complex math in one line** — If unsure, break it into smaller assignments.  

---

## 11) A Minimal “Seeker” Template

```text
CPU_SPEED 2
ARMOR 2
FIRE_RATE 2
ENGINE_SIZE 2
RADAR_RANGE 2
CLOAKING 0
FUEL_CAPACITY 0

define STEP 10
allocate aim

Main
    maxSpeed to speed
    repeat
        aim + STEP to aim to radar
        if radar > 0 and shot > 0 then
            radar/10 + radar to shot
        end
    until FALSE
goto Main
```

---

## 12) Quick Glossary

- **aim** — Where your radar is pointing (degrees).  
- **radar** — Result of a scan (positive distance if a target is found).  
- **direction** — Where the robot is facing/moving (degrees).  
- **speed / maxSpeed** — Current and maximum speed.  
- **shot** — Write a positive number to fire. Treat `shot > 0` as “ready.”  
- **damage** — How much damage you’ve taken.  
- **fuel** — Cloak fuel remaining (if `CLOAKING 1`).  
- **time_int_xfer / time_int_mask** — Set and enable your time interrupt routine.  

---

## 13) Quick Reference (Pocket Size)

```text
Assignment:        expr to var      ; chain: expr to A to B
If/Else:           if cond then ... else ... end
While:             while cond do ... end
Repeat:            repeat ... until cond
Subroutines:       label / gosub label / return
Scan:              aim to radar     ; or direction to radar
Sweep:             aim + step to aim to radar
Fire (ready):      if shot > 0 then radar/10 + radar to shot end
Move:              90 to direction; maxSpeed to speed
Walls:             if near edge then direction + turn to direction
Cloak:             5 to cloak  ; (decrement in interrupt)
```

---

### Uncertainties & Notes

- **Gun readiness** — Patterns strongly indicate `shot > 0` means “ready.” Only write to `shot` then.  
- **Operator precedence** — Beyond `+`, `-`, `/` isn’t evidenced; when unsure, split the expression into steps.  
- **Missing features** — There may be more ops/interrupts in the original docs that aren’t shown in the samples.
