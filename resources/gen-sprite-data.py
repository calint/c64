#!/bin/python3
from PIL import Image
import sys

def gen_sprite_data(wi: int, hi: int, label_ix:int, filename: str):
    """
    Generates C64 sprite data (.byte %XXXXXXXX, %XXXXXXXX, %XXXXXXXX) 
    from a paletted PNG, assuming the sprite dimensions match the C64 format.
    
    The C64 VIC-II sprite format is 24 pixels wide (3 bytes) and 21 pixels high.
    It processes an image tile of size wi x hi pixels.
    """
    
    # C64 VIC-II sprite size
    C64_SPRITE_WIDTH_PIXELS = 24
    C64_SPRITE_HEIGHT_PIXELS = 21

    if wi != C64_SPRITE_WIDTH_PIXELS or hi != C64_SPRITE_HEIGHT_PIXELS:
        print(f"Warning: Expected sprite dimensions {C64_SPRITE_WIDTH_PIXELS}x{C64_SPRITE_HEIGHT_PIXELS} for C64 format, got {wi}x{hi}.")

    try:
        with Image.open(filename) as img:
            if img.mode != "P":
                print("Error: The PNG is not paletted.")
                return

            # Background index (color 0) is non-visible for the sprite bitplane
            BACKGROUND_PALETTE_INDEX = 0

            width, height = img.size

            # Iterate through image tiles (sprites)
            for row in range(0, height, hi):
                for column in range(0, width, wi):
                    # Calculate total bytes for the sprite block
                    num_sprite_bytes = hi * (wi // 8)
                    print(f"\nsprites_data_{label_ix}:")
                    label_ix += 1
                    # Iterate through rows of the current sprite tile
                    for y in range(row, row + hi):
                        byte_list = []
                        row_comment = f" ; row {y - row}"
                        # Iterate through the three 8-pixel bytes in the row
                        for byte_index in range(wi // 8):
                            start_x = column + (byte_index * 8)
                            byte_value = 0
                            # Build the byte from 8 pixels
                            for i in range(8):
                                x = start_x + i
                                # Safety check for image bounds (should not happen if wi is a multiple of 8)
                                if x >= width or y >= height:
                                    print(f"Error: Pixel ({x}, {y}) out of bounds.")
                                    return
                                pixel = img.getpixel((x, y))
                                # Bit is 1 if pixel is NOT the background color
                                bit = 1 if pixel != BACKGROUND_PALETTE_INDEX else 0
                                byte_value = (byte_value << 1) | bit
                            byte_list.append(f"%{byte_value:08b}")
                        # Print the 3 bytes for the current row
                        print(f".byte {', '.join(byte_list)}{row_comment}")
                    # Add the required padding byte at the end of the sprite block
                    print(".byte 0")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 5:
        print("Usage: ./gen-sprite-data.py <width> <height> <start label at index> <filename>")
        sys.exit(1)

    # The output format for C64 sprites is typically 24x21 (wi=24, hi=21)
    # The user example implies this format.
    print("; generate code, do not edit")
    gen_sprite_data(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), sys.argv[4])
