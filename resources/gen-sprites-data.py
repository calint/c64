#!/usr/bin/env python3

from PIL import Image
import sys

if len(sys.argv) < 2:
    print("Usage: ./gen-sprites-data.py <filename>")
    sys.exit(1)

filename = sys.argv[1]

label_ix = 0

print(";")
print("; generated code by `gen-sprites-data.py`, do not edit")
print(";\n")
with Image.open(filename) as img:
    if img.mode != "P":
        print("Error: PNG must be paletted.")
        sys.exit(1)

    img_width, img_height = img.size
    sprite_width, sprite_height = 24, 21  # sprite dims

    for row in range(0, img_height, sprite_height):
        for col in range(0, img_width, sprite_width):
            print(f"sprites_data_{label_ix}:")
            label_ix += 1

            for y in range(row, row + sprite_height):
                bytes_out = []
                for byte_idx in range(3):  # 3 bytes per row
                    x_start = col + byte_idx * 8
                    byte_val = 0
                    for i in range(8):
                        # note: 8 pixels per byte
                        pixel = img.getpixel((x_start + i, y))
                        byte_val = (byte_val << 1) | (0 if pixel == 0 else 1)
                    bytes_out.append(f"%{byte_val:08b}")
                print(f".byte {', '.join(bytes_out)} ; {y - row}")
            print(".byte 0\n")
