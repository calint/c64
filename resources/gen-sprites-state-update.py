#!/usr/bin/env python3

num_sprites = 8
print("; generated code, do not edit")
code = []
for sprite_num in range(num_sprites):
    offset = sprite_num * 4
    code.append(f"    ; sprite {sprite_num}")
    code.append(f"    lda sprites_state+{offset}")
    code.append(f"    sta VIC_SPRITE_{sprite_num}_X")
    code.append(f"    lda sprites_state+{offset + 1}")
    code.append(f"    sta VIC_SPRITE_{sprite_num}_Y")
    code.append(f"    lda sprites_state+{offset + 2}")
    code.append(f"    sta screen_0+SPRITE_IX_OFST+{sprite_num}")
    code.append(f"    sta screen_1+SPRITE_IX_OFST+{sprite_num}")
    code.append(f"    lda sprites_state+{offset + 3}")
    code.append(f"    sta VIC_SPRITE_COLR+{sprite_num}")
    if sprite_num < num_sprites - 1:
        code.append("")
print("\n".join(code))
