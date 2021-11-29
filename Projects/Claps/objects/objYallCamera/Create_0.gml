application_surface_enable(false);
// game_width, game_height are your base resolution (ideally constants)
game_width = 1920 / 3;
game_height = 1080 / 3;
game_height = camera_get_view_height(view_camera[0]);
// in GMS1, set view_wview and view_hview instead
camera_set_view_size(view_camera[0], game_width + 1, game_height + 1);
display_set_gui_size(game_width, game_height);
view_surf = -1;