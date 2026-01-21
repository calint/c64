#!/bin/sh
set -e
cd $(dirname "$0")

./gen-tile-map.py tile-map.tmx 0 0xfffffff >../src/tile_map.s
./gen-render-tile-map.py >../src/render_tile_map.s
./gen-charset.py custom-charset.png >../src/charset_2.s
./gen-sprites-data.py 0 sprites-48.png >../src/sprites_data.s
