function scr_set_alpha() {
	shader_set(shd_alpha);
	with obj_day_and_night_v1 shader_set_uniform_f(u_alpha, alpha);



}
