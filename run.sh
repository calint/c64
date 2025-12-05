#!/bin/sh
set -e
cd "$(dirname "$0")"

resources/update.sh
cl65 -C c64-asm.cfg -u __EXEHDR__ -o program.prg src/program.s
x64 -silent -windowwidth 1920 -windowheight 1360 program.prg
