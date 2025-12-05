#!/bin/bash
set -e
cd $(dirname "$0")

SIZE=${1:-25}
ROWS=${2:-25}
START_ROW=${3:-0}

./parse-tmx.py tile-map.tmx $SIZE 0xfffffff >tile_map.s
./gen-render-code.py SCREEN_0 $START_ROW $ROWS >screen_0.s
./gen-render-code.py SCREEN_1 $START_ROW $ROWS >screen_1.s
