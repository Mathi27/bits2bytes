# STM32 & ARM Cortex-M Deep Dive

## The Processor Core (ARM Cortex-M)

The Cortex-M is a 32-bit RISC (Reduced Instruction Set Computer) processor. Unlike a standard microprocessor, this is a Microcontroller core, meaning it is designed for deterministic, real-time responses.


## Key Architecture Components:

**Register Bank:** Contains 16 core registers (R0-R15). R13 is the Stack Pointer (SP), R14 is the Link Register (LR), and R15 is the Program Counter (PC).

**NVIC** (Nested Vectored Interrupt Controller): The "brain" of event handling. It manages up to 240 interrupts with configurable priority levels.

**SysTick Timer**: A 24-bit system timer used by Real-Time Operating Systems (RTOS) to generate periodic heartbeats.

## The Interconnect (AHB vs. APB)

The "High-Speed Lane." It connects the Core to high-bandwidth entities:

1. Internal Flash Memory
2. SRAM
3. DMA Controllers
4. USB OTG

## APB (Advanced Peripheral Bus)

The "Local Streets." Most peripherals live here. To optimize power, it is split:
1. **APB2**: High-speed peripherals (e.g., Timers 1/8, ADC, SPI1).
2. **APB1**: Low-speed peripherals (e.g., UART, I2C, Watchdogs).