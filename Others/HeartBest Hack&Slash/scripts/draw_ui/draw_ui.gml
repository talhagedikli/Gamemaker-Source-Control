function draw_ui() {
	var _h = display_get_gui_height();
	var _w = display_get_gui_width();

	draw_sprite(sprOverlay, 0, 0, _h);

	for (var i = 0; i < array_length_1d(attr); i++){
	    draw_slider(name[i], 360 + floor(i / 5) * 340, _h - 70 + 15 * (i % 5), limit[i, 0], limit[i, 1], i);
	}

	if (!mouse_check_button(mb_left)){
	    global.holdingSlider = -1;
	}

	draw_sprite(sprTop, 0, 0, 0);
	draw_set_colour(c_black);
	draw_set_alpha(.5);
	draw_line_width(0, 18 + random_range(-1, 1), _w, 40 + random_range(-1, 1), 5); 
	draw_set_alpha(1);
	draw_set_colour(c_white);

	if (!surface_exists(surGlitch)){
	    surGlitch = surface_create(_w, _h);
	}

	surface_set_target(surGlitch);
	gpu_set_blendenable(0);
	draw_clear_alpha(c_white, 0);
	var _str = "bktGlitch 1.3";
	var _str2 = "blokatt.net | @blokatt | 2017-2020";
	draw_set_halign(fa_right);
	draw_set_alpha(.5);
	draw_set_colour(c_purple);
	draw_set_font(fntMain);
	draw_set_halign(fa_left);
	var _sW = 0;
	for (var i = 1; i <= string_length(_str2); i++){
	    draw_text_transformed(20 - 5 + _sW, floor(i / 8) + 1, string_char_at(_str2, i), 1, 1, 0);
	    _sW += string_width(string_char_at(_str2, i));
	}
	draw_set_halign(fa_right);
	draw_text_transformed(_w - 5 - 190, 2,  string_hash_to_newline("Press C to get current configuration.#Press R to randomise."), 1, 1, 0);
	draw_set_font(fntTop);
	draw_text_transformed(_w - 5 - 10 + random_range(1, -1), 5,  string_hash_to_newline(_str), 1, 1, 0);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(fntMain);
	draw_text_transformed(_w - 190, 2,  string_hash_to_newline("Press C to get current configuration.#Press R to randomise."), 1, 1, 0);
	draw_set_halign(fa_left);
	var _sW = 0;
	for (var i = 1; i <= string_length(_str2); i++){
	    draw_text_transformed(20 + _sW, floor(i / 8) + 1, string_char_at(_str2, i), 1, 1, 0);
	    _sW += string_width(string_char_at(_str2, i));
	}
	draw_set_halign(fa_right);
	draw_set_font(fntTop);
	draw_text_transformed(_w - 10, 5,  string_hash_to_newline(_str), 1, 1, 0);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	gpu_set_blendenable(1);
	surface_reset_target();

	gpu_set_blendmode(bm_add);

	shader_set(shdBktGlitch);

	BktGlitch_set_intensity(2.433333);
	BktGlitch_set_line_shift(0.006333);
	BktGlitch_set_line_speed(0.210000);
	BktGlitch_set_line_resolution(1.800000);
	BktGlitch_set_line_drift(0.100000);
	BktGlitch_set_line_vertical_shift(0.000000);
	BktGlitch_set_noise_level(0);
	BktGlitch_set_jumbleness(0.200000);
	BktGlitch_set_jumble_speed(4.000000);
	BktGlitch_set_jumble_resolution(30.000000);
	BktGlitch_set_jumble_shift(0.150000);
	BktGlitch_set_channel_shift(0.004000);
	BktGlitch_set_channel_dispersion(0.002500);
	BktGlitch_set_shakiness(0.800000);
	BktGlitch_set_rng_seed(logoSeed);
	BktGlitch_set_time(current_time * .05);
	BktGlitch_set_resolution(_w, _h);

	headerIntensity = max(0, headerIntensity - .1);
	BktGlitch_set_intensity(headerIntensity);
	draw_surface(surGlitch, 0, 0);
	shader_reset();

	gpu_set_blendmode(bm_normal);


}
