---
sidebar_position: 1
---

# The Physics behind the drones

The goal of this documentation is to understand why a drone flies, starting from the most basic laws of nature.


## First Principle: Air is "Stuff"

To understand flight, you must first change how you view air. Air is not empty space; it is a physical substance, like water, but thinner.

-   **The Concept**: Imagine wading through a pool. You feel the water resisting you.
-   **Application:** A drone propeller does not spin in "nothing." It "swims" through the air, grabbing it and pushing it.
-   
## The Core

In School time and in first year of engineering we mostly use this concept very much -> Its called Newtons law

Now we are going to focus on Netwon's Third Law :

-   **The Rule:** You cannot move yourself; you can only move by pushing against something else.
-   **Analogy:** When you swim, you push water backward to move your body forward.
-   **In Drones:** The propeller is a fan that grabs air and throws it down. Because the air is heavy (it has mass), throwing it down forces the drone up.

## The Propeller

A propeller is actually a screw. Just as a metal screw pulls itself into wood when you turn it, a propeller pulls itself through the air.
-   **The Shape:** The blade is curved (twisted). This curve slices into the air and pushes it downwards.

**Speed (RPM):**
-   **Slow Spin:** The screw pushes a little air. (Gravity wins → Drone stays on ground).
-   **Fast Spin:** The screw pushes a LOT of air. (Lift wins → Drone goes up).


## The Stability Problem: Let's focus on Torque

This is the most common question in drone physics: Why do the motors spin in opposite directions?

**The Problem:** If you sit in a spinning office chair and spin a heavy wheel to the left, your chair will spin to the right. This is **Torque.**

**The Drone Issue:** If all 4 drone motors spun Clockwise, the body of the drone would spin uncontrollably Counter-Clockwise.

**The Solution (The "X" Layout):**

-   Front-Left & Back-Right motors spin Clockwise.
-   Front-Right & Back-Left motors spin Counter-Clockwise.
-   **Result:** The twisting forces fight each other and cancel out. The drone stays steady.

## Vectoring

A drone does not have wheels or a steering wheel. To move sideways, it must change the direction of its "**push**."

### The Tilt Principle

The drone always moves in the direction it tilts.

-   **Hovering:** The propellers push straight down. The drone stays put.
-   **Moving Forward:** The rear motors speed up. This lifts the back of the drone.

Now, the propellers are not pushing straight down; they are pushing down and back.

This pushes the **drone up** and **forward**.

## Summary of Control

The "**Flight Controller**" (computer) manages these simple principles thousands of times a second.

| Command     | What the Physics Does                                      |
|-------------|-------------------------------------------------------------|
| Go Up       | Throw more air down (speed up all motors)                   |
| Go Forward  | Lift the tail (speed up rear motors)                        |
| Turn Left   | Break the torque balance (speed up clockwise motors)        |
