#!/bin/sh
set -e
cd "$(dirname "$0")"

resources/update.sh
cl65 -C linker.cfg -m program.map -o program.prg src/program.s
x64 -silent -windowwidth 1920 -windowheight 1360 -speed 2 program.prg
#x64 -silent -windowwidth 1920 -windowheight 1360 program.prg
