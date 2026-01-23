# c64

experiments with bare metal commodore 64

## intention

* horizontal smooth scrolling tile map
* edit tile map with tiled
* user defined character set in png bitmap
* sprites defined in png bitmap
* sprites with collision detection
* miniature game with 15 minutes playtime

## tools

* `vice 3.9`: emulation
* `cl65 2.18`: assembler, compiler, linker
* `tiled 1.11.2`: tile map editor
* `gimp 3.0.6`: image manipulation
* `python 3.13.11`: automation

## howto

* use joystick on port 2 and "return" key
* snapshots of binary can be found in `/snapshots`
* compile and run using `run.sh` on linux and `run.bat` on windows
  * *note*: requires dependencies

## notes

* releases are considered finished
* tagged versions have been played through to completion
* committed is latest in development code

## screenshots

![u r in roome](screenshots/12.png)
![sprites](screenshots/7.png)
![abstract](screenshots/6.png)
![b/w](screenshots/5.png)
![sample](screenshots/4.png)
![welcome](screenshots/3.png)
![scroll tile map](screenshots/2.png)
![one pixel per frame](screenshots/1.png)

## conclusion

### 1. initial approach

* **started with:** double-buffered screen, shadow sprite structures, and
  bottom-border interrupts for screen swapping
* **ended with:** replaced interrupts with a busy-wait for the bottom border;
  removed shadow sprite structures and updated state during border regions to
  avoid visual artifacts; removed double buffering for accurate collision
  detection; fully unrolled screen update loops every frame, chasing the beam

### 2. tile map rendering

* **full-screen refresh:** abandoned "dirty-tile" rendering in favor of a
  full-screen redraw every frame, giving a known cycle budget and preventing
  stuttering during full redraws
* **side-effect:** since the entire screen is refreshed every frame, individual
  tile update logic was removed

### 3. the raster race

* **first try:** nested loops for rows and columns using indirect addressing were
  too slow to meet the 50 Hz target
* **second try:** column based rendering using generated code
* **problem:** the raster moves top-down while the renderer worked left-to-right,
  meaning the last column had to be finished before the raster reached it on
  first row
* **solution:** switched to a fully unrolled, row-based renderer
* **impact:** lets the CPU chase the raster row by row, freeing ~5,000 extra
  cycles for the update phase at the cost of 7,025 B

### 4. collision detection

* **double buffer:** removed double buffering because it caused a one-frame lag
  in hardware sprite-to-background collision detection
* **single buffer:** since the tile map renderer can start a few scanlines before
  the visible area, double buffering had no clear use
* **alignment:** background rendering and sprite updates now happen in the same
  frame, keeping collision results current and preventing the hero from getting
  stuck in the background without escape
* **escape logic:** added a horizontal movement boost when the hero is in
  collision state caused by animation frames, allowing hero to escape

### 5. performance

* **total frame budget:** ~19,000 cycles (PAL)
* **tile map renderer:** 10,025 cycles.
* **updated budget:** ~5,000 extra cycles available for game logic before the
  rendering falls behind the raster
* **discarded option**: self modifying code was tested but turned out to be more
  expensive for full-screen rendering
