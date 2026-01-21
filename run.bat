set CC65_BIN=..\cc65\bin
set VICE_PATH=..\SDL2VICE-3.9-win64

cd resources
call update
cd ..
%CC65_BIN%\cl65 -C linker.cfg -o program.prg src\main.s
%VICE_PATH%\x64sc -silent -windowwidth 1024 -windowheight 768 program.prg
