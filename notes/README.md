```text
[ ] when getting tile check that y is within range 0 and 24
[-] hero jumping freezes animation
    => @hero_physics: when jumping, frame counter is not increased
    => no change made since it looks funny
[x] animation should display first frame when initiated
    => it looks better if it does not with a slight delay before hero changes
       after starting to move
    => fixed
[x] hero_restarting, hero_moving and hero_jumping to hero_flags
[x] since writing to tile map needs redraw and there is no useful code to do
    when tile map is not redrawn and only then, redraw map and see cycles budget
    for 50 fps as the hard limit
    [x] variable tile_map_x now redundant
[x] consider removing irq for raster line and busy wait instead if running at
    full frame rate
[x] game mechanics
    platformer elements when climbing and walking on text such as quotes, good
    sayings, paragraphs etc
[x] sprites 16x16 of hero climbing, jumping, crouching, walking
[ ] projectiles could be illustrated in the color map only
[ ] minor priority: clc may be unnecessary in certain cases
```

## 6502 hardware bugs

<https://www.youtube.com/watch?v=ZsRRCnque2E>  21:25

* JMP Ind Page Boundary
* RMW Double Store
* Ghost Read
* Lost BRK

## Curious VIC chip

* 4 banks of 16 KB each, however, bank 0 and 2 have sections that always access
  ROM
* bad lines when VIC "steals" cycles from CPU on first pixel row of every
  character line

## Screen on Vice PAL

* Bottom border (PAL): raster line 251
* 25 row display: first visible pixel y 50, last visible y 249
* 38 column display: first visible pixel x 31, last visible x 334
* 40 column display: first visible pixel x 24, last visible x 343
