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

### 1. synchronization and state management

* **initial state:** used a double-buffered screen with shadow sprite structures
  and bottom-border interrupts for screen swapping
* **simplification:** replaced interrupts with a busy-wait for the bottom border
* **flicker free:** removed shadow sprite structures and updates sprite states
  during border regions to avoid visual artifacts

### 2. rendering

* **full-screen refresh:** abandoned "dirty-tile" rendering in favor of a full-
  screen redraw every frame ensuring a deterministic cycle budget and prevents
  CPU-bound stuttering during heavy logic frames
* **side-effect:** since the entire screen is refreshed, individual tile update
  logic was removed

### 3. solving the raster race

* **first try:** using a loop for rows and loop for column using indirect addressing
  was too slow for 50 Hz performance goal
* **second try:** column based rendering with generated code
* **problem:** the raster beam outpaced the CPU, rendering the end of a row before
  the CPU could finish updating it (last column rendered last)
* **solution:** implemented a row-based unroll of every tile
* **impact:** allows the CPU to "chase" the raster beam row-by-row freeing ~5000
  cycles for the "update" phase but using ~7 KB

### 4. hardware-correct collision detection

* **double buffer:** removed double buffering because it caused a one-frame lag in
  hardware sprite-to-background collision detection
* **single buffer:** since rendering of tile map can start a few scanlines before
  the visible area, "chasing the beam", double buffering has no apparent use
* **alignment:** background and sprite states are now processed in the same frame,
  ensuring the collision state is current and preventing the hero from getting
  stuck in the background without escape
* **escape logic:** implemented a horizontal movement boost applied during collision
  states to allow the hero to escape overlapping tiles

## 5. performance

* **tile map renderer:** ~10,000 cycles.
* **optimization:** unrolled rendering is ~8,700 cycles faster than looped
  equivalents
* **update budget:** ~5,000 free cycles for game logic during the "update" phase
  before the raster outpaces the renderer
