set CC65_BIN=..\cc65\bin
set VICE_PATH=..\SDL2VICE-3.9-win64

..\resources\update.bat
%CC65_BIN%\cl65.exe -C linker.cfg -o program.prg src\main.s
%VICE_PATH%\x64sc.exe -silent -windowwidth 1024 -windowheight 768 program.prg
