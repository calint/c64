#!/bin/sh
set -e
cd $(dirname "$0")

SIZE=${1:-25}
ROWS=${2:-25}
START_ROW=${3:-0}

./gen-tile-map.py tile-map.tmx $SIZE 0xfffffff >../src/tile_map.s
./gen-render-to-screen.py screen_0 $START_ROW $ROWS >../src/render_to_screen_0.s
./gen-render-to-screen.py screen_1 $START_ROW $ROWS >../src/render_to_screen_1.s
./gen-charset.py 8 8 custom-charset.png >../src/charset_2.s
