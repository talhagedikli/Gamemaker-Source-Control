event_inherited();
#macro view view_camera[0]
// following = noone;
// gameWidth = 1920/4;
// gameHeight = 1080/4;

// scale = 3;

// window_set_size(gameWidth*scale, gameHeight*scale);
// var m = function() { window_center(); }
// var t = time_source_create(time_source_game, 1, time_source_units_frames, m);
// time_source_start(t);

// surface_resize(application_surface, gameWidth*scale, gameHeight*scale);
enum CameraStates 
{
	normal,
	pixelated
}
state = CameraStates.pixelated;

// yallcc camera
application_surface_enable(false);
// gameWidth, gameHeight are your base resolution (ideally constants)
gameWidth = 1920/3;
gameHeight = 1080/3;
// gameWidth = camera_get_view_width(view_camera[0]);
// gameHeight = camera_get_view_height(view_camera[0]);

scale = 2;
// in GMS1, set view_wview and view_hview instead
camera_set_view_size(view, gameWidth + 1, gameHeight + 1);
display_set_gui_size(gameWidth, gameHeight);
window_set_size(gameWidth*scale, gameHeight*scale);
view_surf = -1;
