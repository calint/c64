# resources used for generated source

## custom charset used in application

![custom charset](custom-charset.png)

## tile map

* use `tiled` to edit project `world.tiled-project`

## howto

* run `update.sh` to refresh generated source in `../src/`

## miscellaneous

### standard c64 charset

![standard c64 charset](c64_upp.gif)

### source generators

* `gen-charset.py`: generates `../src/charset_2.s`
* `gen-render-to-screen.py`: generates `../src/render_to_screen_0.s` and `../src/render_to_screen_1.s`
* `gen-tile-map.py`: generates `../src/tile_map.s`
