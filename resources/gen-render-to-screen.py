#!/usr/bin/env python3
"""
Generate unrolled C64 assembly code for tile map rendering.

Usage:
    python gen-render-code.py SCREEN_0 0 25
    python gen-render-code.py SCREEN_1 3 22
"""

import sys

def generate_tile_render(screen_name, y_offset, num_rows):
    """
    Generate unrolled assembly code for rendering tiles.
    
    Args:
        screen_name: Screen buffer name (e.g., "SCREEN_0", "SCREEN_1")
        y_offset: Starting Y offset for screen rows (integer)
        num_rows: Number of rows to render
    """
    lines = []
    
    for i in range(num_rows):
        tile_row = i
        screen_row = y_offset + i
        
        lines.append(f"    lda tile_map+TILE_MAP_WIDTH*{tile_row:2d},x")
        lines.append(f"    sta {screen_name}+  SCREEN_WIDTH*{screen_row:2d},y")
    
    return "\n".join(lines)


def main():
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
    
    print("; generate code, do not edit")
    print(generate_tile_render(screen_name, y_offset, num_rows))


if __name__ == "__main__":
    main()
