#!/bin/sh
set -e

cl65 -C c64-asm.cfg -u __EXEHDR__ -o program.prg src/program.s
x64 -silent -windowwidth 1536 -windowheight 1088 program.prg
