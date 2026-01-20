#!/usr/bin/env python3

import sys

if len(sys.argv) != 4:
    print("Usage: ./gen-render-to-screen.py <SCREEN_NAME> <Y_OFFSET> <NUM_ROWS>")
    sys.exit(1)

screen_name = sys.argv[1]
screen_y_offset = int(sys.argv[2])
num_rows = int(sys.argv[3])
lines = []

print("    ;")
print("    ; generated code by `gen-render-to-screen.py`, do not edit")
print("    ;\n")
for i in range(num_rows):
    tile_row = i
    screen_row = screen_y_offset + i
    lines.append(f"    lda tile_map + TILE_MAP_WIDTH * {tile_row:2d}, x")
    lines.append(f"    sta {screen_name} + SCREEN_WIDTH * {screen_row:2d}, y")

print("\n".join(lines))
