#!/bin/sh
set -e

cl65 -C c64-asm.cfg -u __EXEHDR__ -o program.prg program.s
x64 program.prg
