/// @description not to draw


if (!surface_exists(surGround)) {
	surGround	= surface_create(room_width, room_height);
} else {
	shader_set(shGround);
	shader_set_uniform_f(uTime, current_time);
	draw_surface(surGround, 0, 0);
	shader_reset();
}