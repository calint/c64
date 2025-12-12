#!/bin/python3

from PIL import Image
import sys


def gen_charset(filename: str):
    try:
        with Image.open(filename) as img:
            if img.mode != "P":
                print("Error: The PNG is not paletted.")
                return

            BACKGROUND_PALETTE_INDEX = 0

            wi = 8
            hi = 8
            width, height = img.size
            ix = 0
            for row in range(0, height, hi):
                for column in range(0, width, wi):
                    print(f"; {ix}")
                    ix += 1
                    for y in range(row, row + hi):
                        for start_x in range(column, column + wi, 8):
                            byte_value = 0
                            for i in range(8):
                                x = start_x + i
                                pixel = img.getpixel((x, y))
                                bit = 1 if pixel != BACKGROUND_PALETTE_INDEX else 0
                                byte_value = (byte_value << 1) | bit
                            print(f".byte %{byte_value:08b}", end="")
                        print()

    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: ./gen-charset.py <filename>")
        sys.exit(1)
    print("; generated code, do not edit")
    gen_charset(sys.argv[1])
