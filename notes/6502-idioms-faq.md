# 6502 Idioms – Task-Oriented FAQ

This document collects **common, expert-approved 6502 idioms**, organized by *task* rather than by instruction. The goal is to capture how experienced 6502 programmers actually think and write code.

All examples assume NMOS 6502 unless stated otherwise.

---

## Table of Contents

1. Loading and Testing Values
2. Branching Idioms
3. Arithmetic and Comparisons
4. Memory Access and Pointers
5. Loops and Counters
6. Flags as Data
7. Bit Manipulation
8. Zero Page Tricks
9. Stack Idioms
10. Control Flow Patterns
11. Performance Idioms
12. Common Pitfalls

---

## 1. Loading and Testing Values

### Test if memory is zero

```asm
    lda value
    beq is_zero
```

**Why:** `LDA` sets Z directly. No need for `CMP #0`.

---

### Test if memory is non-zero

```asm
    lda value
    bne not_zero
```

---

### Test sign (negative)

```asm
    lda value
    bmi is_negative
```

Uses bit 7 directly via N flag.

---

## 2. Branching Idioms

### Branch always

```asm
    bne *+2
```

or more readably:

```asm
    jmp target
```

Use `BNE` trick only in tight loops where cycles matter.

---

### If / else structure

```asm
    lda cond
    beq else

    ; then-branch
    jmp end_if

else:
    ; else-branch
end_if:
```

---

## 3. Arithmetic and Comparisons

### Compare A with memory

```asm
    lda a_value
    cmp b_value
    bcc a_less_than_b
```

**Flags after CMP:**

- C = A >= M
- Z = A == M

---

### Add with carry (multi-byte)

```asm
    clc
    lda a_lo
    adc b_lo
    sta r_lo

    lda a_hi
    adc b_hi
    sta r_hi
```

Canonical 16-bit addition.

---

### Subtract (A - B)

```asm
    sec
    lda a
    sbc b
```

**Rule:** `SEC` before subtraction.

---

## 4. Memory Access and Pointers

### Zero-page pointer (read)

```asm
    lda (ptr),y
```

Used for tables, structures, and streams.

---

### Zero-page pointer (write)

```asm
    sta (ptr),y
```

Classic for rendering and copying.

---

### Indexed table lookup

```asm
    ldx index
    lda table,x
```

Fast, compact, idiomatic.

---

## 5. Loops and Counters

### Count-down loop (preferred)

```asm
    ldx #count
loop:
    ; body
    dex
    bne loop
```

**Why:** No comparison needed, tight timing.

---

### Count-up loop

```asm
    ldx #0
loop:
    ; body
    inx
    cpx #limit
    bne loop
```

Clear but slightly heavier.

---

## 6. Flags as Data

### Save comparison result without branching

```asm
    cmp value
    php
    ; later
    plp
```

Rare but useful in parsers and evaluators.

---

### Boolean result in A (0 or 1)

```asm
    lda #0
    adc #0
```

Uses carry as boolean input.

---

## 7. Bit Manipulation

### Test a bit

```asm
    lda value
    and #$08
    bne bit_set
```

---

### Test bit without destroying A

```asm
    bit value
    bmi bit7_set
```

Uses memory bits for N and V.

---

### Shift and accumulate

```asm
    asl a
    rol result
```

Classic multi-byte shift.

---

## 8. Zero Page Tricks

### Fast temporary storage

```asm
    sta tmp
    ; do work
    lda tmp
```

ZP is effectively a register file.

---

### Pointer increment

```asm
    inc ptr
    bne :+
    inc ptr+1
:
```

Canonical 16-bit increment.

---

## 9. Stack Idioms

### Save A across code

```asm
    pha
    ; clobbers A
    pla
```

---

### Call-like behavior without JSR

```asm
    pha
    lda #<ret
    pha
    lda #>ret
    pha
    jmp target
ret:
```

Advanced, rare, but powerful.

---

## 10. Control Flow Patterns

### Jump table

```asm
    asl a
    tay
    lda table+1,y
    pha
    lda table,y
    pha
    rts
```

Fast indirect dispatch.

---

### State machine

```asm
    lda state
    asl a
    tay
    jmp (state_table,y)
```

Used heavily in games and demos.

---

## 11. Performance Idioms

### Avoid branches in inner loops

Prefer flag-based math over branching when possible.

---

### Unroll when predictable

```asm
    lda src
    sta dst
    lda src+1
    sta dst+1
```

Costs ROM, saves cycles.

---

## 12. Common Pitfalls

- Forgetting `SEC` before `SBC`
- Using `CMP #0` instead of `LDA`
- Overusing stack in tight loops
- Assuming flags survive loads/stores

---

## Closing Note

6502 idioms reward **local reasoning**:

- one register
- explicit flags
- visible dataflow

Mastery comes from *composing small, obvious steps* into powerful structures.

This is the 6502 way.
