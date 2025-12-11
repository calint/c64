#!/usr/bin/env python3
from PIL import Image
import sys

def gen_sprites_data(label_ix: int, filename: str):
    """Generate C64 sprite data from paletted PNG (24x21 px per sprite)"""
    
    try:
        with Image.open(filename) as img:
            if img.mode != "P":
                print("Error: PNG must be paletted.")
                return

            w, h = img.size
            sw, sh = 24, 21  # sprite dims

            for row in range(0, h, sh):
                for col in range(0, w, sw):
                    print(f"\nsprites_data_{label_ix}:")
                    label_ix += 1

                    for y in range(row, row + sh):
                        bytes_out = []
                        for byte_idx in range(3):  # 3 bytes per row
                            x_start = col + byte_idx * 8
                            byte_val = 0
                            for i in range(8):
                                pixel = img.getpixel((x_start + i, y))
                                byte_val = (byte_val << 1) | (0 if pixel == 0 else 1)
                            bytes_out.append(f"%{byte_val:08b}")
                        print(f".byte {', '.join(bytes_out)} ; {y - row}")
                    print(".byte 0")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: ./gen-sprites-data.py <start_label_index> <filename>")
        sys.exit(1)
    
    print("; generated code, do not edit")
    gen_sprites_data(int(sys.argv[1]), sys.argv[2])
