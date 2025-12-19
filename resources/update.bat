python.exe gen-tile-map.py tile-map.tmx 0 0xfffffff >../src/tile_map.s
python.exe gen-render-to-screen.py screen_0 0 25 >../src/render_to_screen_0.s
python.exe gen-render-to-screen.py screen_1 0 25 >../src/render_to_screen_1.s
python.exe gen-sprites-state-update.py >../src/update_sprites_state.s
python.exe gen-charset.py custom-charset.png >../src/charset_2.s
python.exe gen-sprites-data.py 0 sprites-48.png >../src/sprites_data.s
