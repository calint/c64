```text
[x] since writing to tile map needs redraw and there is no useful code to do
    when tile map is not redrawn and only then, redraw map and see cycles budget
    for 50 fps as the hard limit
[x] consider removing irq for raster line and busy wait instead if running at
    full frame rate
[x] game mechanics
    platformer elements when climbing and walking on text such as quotes, good
    sayings, paragraphs etc
[ ] sprites 16x16 of hero climbing, jumping, crouching, walking
[ ] projectiles could be illustrated in the color map only
[ ] minor priority: clc may be unnecessary in certain cases
```

## The VIC-II "odd" numbers due to hardware timing

* Raster line 251: Bottom border (not 250 or 252)
* Cycle 17: Bad line DMA starts (not 16 or 18)
* 50 pixels: Top border in 25-row mode (not 48 or 52)
* 31 pixels: Left border in 38-column mode
