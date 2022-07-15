// camera_set_view_size(view, gameWidth, gameHeight);

// if (instance_exists(following))
// {
// 	var xx = following.x-gameWidth*0.5;
// 	var yy = following.y-gameHeight*0.5;
	
// 	var _cur_x = camera_get_view_x(view);
// 	var _cur_y = camera_get_view_y(view);
	
// 	var _spd = .1;
	
// 	camera_set_view_pos(view, 
// 		lerp(_cur_x, xx, _spd),
// 		lerp(_cur_y, yy, _spd));
// }

// Yalcc camera
// in GMS1, set view_xview and view_yview instead
camera_set_view_pos(view_camera[0], floor(x), floor(y));
if (!surface_exists(view_surf)) {
    view_surf = surface_create(gameWidth + 1, gameHeight + 1);
}
view_surface_id[0] = view_surf;