#!/usr/bin/env python3

num_sprites = 8
print("    ;")
print("    ; generated code, do not edit")
print("    ;\n")
code = []
ix = 0
for sprite_num in range(num_sprites):
    offset = sprite_num * 4
    code.append(f"    ; sprite {sprite_num}")
    code.append(f"    lda sprites_state + {ix} * .sizeof(s) + s::sx")
    code.append(f"    sta VIC_SPRITE_{sprite_num}_X")
    code.append(f"    lda sprites_state + {ix} * .sizeof(s) + s::sy")
    code.append(f"    sta VIC_SPRITE_{sprite_num}_Y")
    code.append(f"    lda sprites_state + {ix} * .sizeof(s) + s::data")
    code.append(f"    sta screen_0 + SPRITE_IX_OFST + {sprite_num}")
    code.append(f"    sta screen_1 + SPRITE_IX_OFST + {sprite_num}")
    code.append(f"    lda sprites_state + {ix} * .sizeof(s) + s::color")
    code.append(f"    sta VIC_SPRITE_COLR + {sprite_num}")
    ix = ix + 1
    if sprite_num < num_sprites - 1:
        code.append("")
print("\n".join(code))
