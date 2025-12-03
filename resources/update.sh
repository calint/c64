#!/bin/bash
set -e
cd $(dirname "$0")

SIZE=${1:-25}

./parse-tmx.py tile-map.tmx $SIZE 0xfffffff >tile_map.s
