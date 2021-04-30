function scr_set_alpha_v1_1() {
	shader_set(shd_alpha);
	with obj_day_and_night_v1_1 shader_set_uniform_f(u_alpha, alpha);



}
