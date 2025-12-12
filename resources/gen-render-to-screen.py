#!/usr/bin/env python3
import sys


def generate_tile_render(screen_name, y_offset, num_rows):
    lines = []

    for i in range(num_rows):
        tile_row = i
        screen_row = y_offset + i

        lines.append(f"    lda tile_map+TILE_MAP_WIDTH*{tile_row:2d},x")
        lines.append(f"    sta {screen_name}+  SCREEN_WIDTH*{screen_row:2d},y")

    return "\n".join(lines)


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: ./gen-render-to-screen.py <SCREEN_NAME> <Y_OFFSET> <NUM_ROWS>")
        print()
        print("Examples:")
        print("  python gen-render-code.py SCREEN_0 0 25")
        print("  python gen-render-code.py SCREEN_1 3 22")
        sys.exit(1)

    screen_name = sys.argv[1]
    y_offset = int(sys.argv[2])
    num_rows = int(sys.argv[3])

    print("; generated code, do not edit")
    print(generate_tile_render(screen_name, y_offset, num_rows))
