#!/bin/sh
set -e
cd $(dirname "$0")

RENDER_START_ROW=0
RENDER_N_ROWS=25

./gen-tile-map.py tile-map.tmx 0 0xfffffff >../src/tile_map.s
./gen-render-to-screen.py screen_0 $RENDER_START_ROW $RENDER_N_ROWS >../src/render_to_screen_0.s
./gen-render-to-screen.py screen_1 $RENDER_START_ROW $RENDER_N_ROWS >../src/render_to_screen_1.s
./gen-sprites-state-update.py >../src/update_sprites_state.s
./gen-charset.py custom-charset.png >../src/charset_2.s
./gen-sprites-data.py 0 sprites-48.png >../src/sprites_data.s
