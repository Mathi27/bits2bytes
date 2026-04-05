$file1 = @"
---
sidebar_position: 1
title: 1. LED Blink (Basic GPIO Output)
description: Learn the basics of General Purpose Input/Output (GPIO) by blinking an LED in bare-metal C.
---

# ?? Lab 1: LED Blink (Basic GPIO Output)

Welcome to your first STM32 coding exercise! In this lab, we will cover the foundational concept of embedded systems: **turning an LED on and off** using bare-metal C programming.

Instead of relying on hardware abstraction layer (HAL) libraries, we will directly manipulate the microcontroller's memory-mapped registers. This will give you a profound understanding of how the silicon actually works.

---

## ?? Learning Objectives
- Understand the clock enabling process in STM32 (`RCC`).
- Configure a General Purpose I/O (GPIO) pin as an **Output**.
- Write directly to the output data registers (`ODR`) to toggle voltage levels.
- Implement a basic software delay function.

## ?? Hardware Required
- STM32 Development Board (e.g., STM32F4 series).
- An onboard LED (commonly connected to GPIOD pins 12-15 on STM32F4 Discovery).

---

## ?? Theory: The Registers We Will Use

Before a peripheral (like a GPIO port) can function, we must supply power/clock to it. Once active, we configure its mode (Input or Output) and then write our data.

1. **`AHB1_ENR`**: Advanced High-Performance Bus 1 Enable Register. Controls the clock to GPIO ports.
2. **`GPIOD_MODER`**: GPIO Mode Register. Decides if a pin is an Input, Output, Alternative function, or Analog.
3. **`GPIOD_ODR`**: GPIO Output Data Register. Controls the High/Low (3.3V/0V) electrical state of the pins.

---

## ?? The Code

Here is the complete bare-metal code for blinking a single LED. Let's look at the implementation:

```c
#define RCC_BASE 0x40023800UL
#define AHB1_ENR *(volatile unsigned int*)(RCC_BASE + 0x30U)

#define GPIO_D_BASE 0x40020C00UL
#define GPIOD_MODER *(volatile unsigned int*)(GPIO_D_BASE + 0x00U)
#define GPIOD_ODR   *(volatile unsigned int*)(GPIO_D_BASE + 0x14U)

// A simple software loop to delay execution
void led_delay(void) {
    for (int i = 0; i <= 150000; i++);
}

int main(void) {
    // 1. Enable clock for GPIOD (Bit 3 corresponds to Port D)
    AHB1_ENR |= (1 << 3);
    
    // 2. Configure a specific pin as Output. 
    // Usually, LEDs are on Pins 12, 13, 14, or 15. Let's assume pin 'n' here.
    int n = 12; // Choosing LED on Pin 12
    
    GPIOD_MODER &= ~(3 << (n * 2)); // Clear mode bits
    GPIOD_MODER |= (1 << (n * 2));  // Set as output mode (01)
    
    // Clear initial sequence
    GPIOD_ODR &= ~(1 << n);

    // 3. Infinite Application Loop
    while (1) {
        GPIOD_ODR |= (1 << n);  // Turn LED ON
        led_delay();            // Wait

        GPIOD_ODR &= ~(1 << n); // Turn LED OFF
        led_delay();            // Wait
    }
}
```

---

## ?? Code Walkthrough

1. **Base Addresses:** We define memory pointers representing the location of hardware registers. Notice the `volatile` keyword? It prevents the compiler from optimizing away our direct memory accesses.
2. **Clock Initialization:** We perform bitwise `OR` (`|=`) to flip bit 3 in `AHB1_ENR`. Now, Port D is powered up.
3. **Pin Configuration:** Every pin gets 2 bits in `MODER`. To set pin $n$, we shift by $n \times 2$. We clear existing values, then `OR` with `1` to establish General Purpose Output mode.
4. **Blinking Logic:** In our `while(1)` loop, we flip the $n$-th bit in the `ODR` register HIGH (1) and LOW (0) repeatedly, separated by a software block loop.

---

## ? Next Steps
Ready for a challenge? Proceed to **Exercise 1.1** where you will optimize this logic using functions to control multiple LEDs simultaneously!
"@

$file11 = @"
---
sidebar_position: 2
title: 1.1. Multiple LED Blink
description: Extend your code to blink multiple LEDs using modular functions.
---

# ? Task 1.1: Multiple LED Blink

Welcome to the **first Extra Task**! 

In Lab 1, you learned how to blink a single LED by shifting bits manually within the `main()` function. While that approach works, copy-pasting code for four different LEDs creates messy and hard-to-maintain files.

In this exercise, we introduce **Modular Programming in C** by abstracting register configuration and toggling into reusable functions.

---

## ?? Learning Objectives
- Refactor hardware control logic into modular C functions.
- Understand how variable pin indexing allows reusable logic.
- Command multiple GPIO pins concurrently.

## ?? Theory: Why Abstract?

By writing a generic function `void mode(int n)`, we only need to pass the target pin number to configure it dynamically. This reduces code bloat and prevents hard-to-track bitwise errors later on.

---

## ?? The Code

Below is the optimized bare-metal C code to blink multiple LEDs on pins 12, 13, 14, and 15 using modular functional breakdown.

```c
#define RCC_BASE 0x40023800UL
#define AHB1_ENR *(volatile unsigned int*)(RCC_BASE + 0x30U)

#define GPIO_D_BASE 0x40020C00UL
#define GPIOD_MODER *(volatile unsigned int*)(GPIO_D_BASE + 0x00U)
#define GPIOD_ODR   *(volatile unsigned int*)(GPIO_D_BASE + 0x14U)

// General delay function
void led_delay(void) {
    for (int i = 0; i <= 150000; i++);
}

// Configures any Port D pin as an output
void mode(int n) {
    // Clear mode bits completely (11 -> 00)
    GPIOD_MODER &= ~(3 << (n * 2));
    // Set to 01 (General purpose output mode)
    GPIOD_MODER |= (1 << (n * 2));
    // Initialize the line to Low
    GPIOD_ODR &= ~(1 << n);
}

// Turns a specific LED ON
void led_on(int n) {
    GPIOD_ODR |= (1 << n);
    led_delay();
}

// Turns a specific LED OFF
void led_off(int n) {
    GPIOD_ODR &= ~(1 << n);
    led_delay();
}

int main(void) {
    // 1. Enable clock for GPIOD
    AHB1_ENR |= (1 << 3);

    // 2. Set pins 12, 13, 14, and 15 as output
    mode(12);
    mode(13);
    mode(14);
    mode(15);

    // 3. Application Loop
    while (1) {
        // Turn them on sequentially
        led_on(12);
        led_on(13);
        led_on(14);
        led_on(15);

        // Turn them off sequentially
        led_off(12);
        led_off(13);
        led_off(14);
        led_off(15);
    }
}
```

---

## ?? Code Walkthrough

1. **`mode(int n)` Method:** We replaced manual bitwise shifts for every single pin with a dynamic argument `n`. The method automatically calculates the correct bit offsets (`n * 2`) to edit the proper pair of bits in `MODER`.
2. **`led_on(n)` & `led_off(n)` Methods:** Simplifies the visual readability of our `while(1)` block. It's instantly obvious what the application is trying to do.
3. **The Result:** Instead of 16 lines of confusing register operations inside `main`, we read a clean sequence that powers up our four GPIOs and cycles them sequentially like a marquee.

Now you have a structured, elegant module! Up next: Learning how to interact with inputs and toggle LEDs using bitwise XORs!
"@

Set-Content -Path "d:\soi\b2b\bits2bytes\docs\STM32\1.LED Blink (Basic GPIO Output).md" -Value $file1 -Encoding UTF8
Set-Content -Path "d:\soi\b2b\bits2bytes\docs\STM32\1.1.Multiple LED Blink .md" -Value $file11 -Encoding UTF8
