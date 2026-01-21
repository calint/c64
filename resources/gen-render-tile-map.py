#!/usr/bin/env python3

print("    ;")
print("    ; generated code by `gen-render-tile-map.py`, do not edit")
print("    ;")
print()
print("    ; ~10,075 cycles vs ~18,725 cycles using loops")
lines = []
for i in range(25):
    lines.append("")
    lines.append(f"    ; row {i}")
    lines.append("    ldx tmp1")
    for j in range(40):
        lines.append(f"    lda tile_map + TILE_MAP_WIDTH * {i:2d}, x")
        lines.append(f"    sta screen + SCREEN_WIDTH * {i:2d} + {j:2d}")
        if j < 39:
            lines.append("    inx")

print("\n".join(lines))
