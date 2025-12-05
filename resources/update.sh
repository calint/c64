#!/bin/bash
set -e
cd $(dirname "$0")

SIZE=${1:-21}
ROWS=${2:-21}
START_ROW=${3:-4}

./parse-tmx.py tile-map.tmx $SIZE 0xfffffff >tile_map.s
./gen-render-code.py SCREEN_0 4 21 >screen_0.s
./gen-render-code.py SCREEN_1 4 21 >screen_1.s
