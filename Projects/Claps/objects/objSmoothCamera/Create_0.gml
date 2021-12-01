application_surface_enable(false);
// game_width, game_height are your base resolution (ideally constants)
following = noone;
Follow = function(_id = self.id)
{
	self.following = _id;
}
game_width = camera_get_view_width(VIEW);
game_height = camera_get_view_height(VIEW);

// in GMS1, set view_wview and view_hview instead
//camera_set_view_size(VIEW, game_width, game_height);
surface_resize(application_surface, game_width, game_height);
camera_set_view_size(VIEW, game_width + 1, game_height + 1);
display_set_gui_size(game_width, game_height);

view_surf = -1;