function scr_use_template_mockup() {
	//-----------------------------------------------------------------------------
	/// @description sets up a preset mockup layers and characters
	//-----------------------------------------------------------------------------
	/// @param mockup-enum

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	This is the easiest way to set up a mockup. you can choose a preset and this
	script will automatically create all scroll layers and a mockup character.

	If you want to set-up a mockup yourself, use these scripts instead:
		scr_add_mockup_character(...)
		scr_add_mockup_scroll_layer(...)
	
	You can also add more presets to this script. Just don't forget to add an enum.

	To remove all mockup instances from the game you can use:
		scr_remove_mockups()

	//-----------------------------------------------------------------------------
		Example:
	//-----------------------------------------------------------------------------
	Create Event:
	-------------
		scr_use_template_mockup(mockup.gothicvaniatown_lo_res);

	This will set up a multilayered mockup of a gothic town and moonwalking baker.
	The application surface will be downsized and then drawn upscaled to the screen.

		scr_use_template_mockup(mockup.gothicvaniatown_hi_res);
	This mockup is similar to the prvious. But this time the application surface
	keeps its size and the mockup images are drawn upscaled to the surface.

	The different uses for these two mockups is simple:
	If we tst a postprocessing shader on the application surface, the size of the
	surface matters in performance and looks.

	//---------------------------------------------------------------------------*/

	enum mockup {
		gothicvaniatown_lo_res,
		gothicvaniatown_hi_res,
		squareblocks_lo_res,
		squareblocks_hi_res,
		graveyard_hi_res,
		space_lo_bit_lo_res,
		space_lo_bit_hi_res
	}

	var inst;

	switch (argument[0]) {
		case mockup.gothicvaniatown_lo_res:
			scr_remove_mockups();
			scr_camera_set_scale(3);

			scr_add_mockup_scroll_layer(spr_gothicvania_town_sky,			1, 1, 0, 0, 0,		0, 3);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_background,	1, 1, 0, 0, -0.5,	0, 2);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_middleground,	1, 1, 0, 0, -1,		0, 1);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_foreground,	1, 1, 0, 0, -1.333,	0, -1);

			scr_add_mockup_character(spr_gothicvania_baker_right_walk, 1, 1, 156, 236, 0.5, 0);
			break;
		
		case mockup.gothicvaniatown_hi_res:
			scr_remove_mockups();
			scr_camera_set_scale(1);

			scr_add_mockup_scroll_layer(spr_gothicvania_town_sky,			3, 3, 0, 0, -0.5,	0, 3);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_background,	3, 3, 0, 0, -1.5,	0, 2);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_middleground,	3, 3, 0, 0, -3,		0, 1);
			scr_add_mockup_scroll_layer(spr_gothicvania_town_foreground,	3, 3, 0, 0, -4,		0, -1);

			scr_add_mockup_character(spr_gothicvania_baker_right_walk, 3, 3, 420, 707,	0.5, 0);
			break;
		
		case mockup.squareblocks_lo_res:
			scr_remove_mockups();
			scr_camera_set_scale(4);

			scr_add_mockup_scroll_layer(spr_square_blocks_sky,		1, 1, 0, 0, -0.25,	0, 4);
			scr_add_mockup_scroll_layer(spr_square_blocks_bg2,		1, 1, 0, 0, -0.5,	0, 3);
			scr_add_mockup_scroll_layer(spr_square_blocks_bg1,		1, 1, 0, 0, -0.82,	0, 2);
			scr_add_mockup_scroll_layer(spr_square_blocks_main,		1, 1, 0, 0, -1.0,	0, 1);
			scr_add_mockup_scroll_layer(spr_square_blocks_fg1,		1, 1, 0, 0, -1.24,	0, -1);
			scr_add_mockup_scroll_layer(spr_square_blocks_fg2,		1, 1, 0, 0, -1.49,	0, -2);

			scr_add_mockup_character(spr_gumbot_right_walk,	1, 1, 110, 111, 1, 0);
			break;
		
		case mockup.squareblocks_hi_res:
			scr_remove_mockups();
			scr_camera_set_scale(1);

			scr_add_mockup_scroll_layer(spr_square_blocks_sky,		4, 4, 0, 0, -1.0,	0, 4);
			scr_add_mockup_scroll_layer(spr_square_blocks_bg2,		4, 4, 0, 0, -2.0,	0, 3);
			scr_add_mockup_scroll_layer(spr_square_blocks_bg1,		4, 4, 0, 0, -3.28,	0, 2);
			scr_add_mockup_scroll_layer(spr_square_blocks_main,		4, 4, 0, 0, -4.0,	0, 1);
			scr_add_mockup_scroll_layer(spr_square_blocks_fg1,		4, 4, 0, 0, -5.0,	0, -1);
			scr_add_mockup_scroll_layer(spr_square_blocks_fg2,		4, 4, 0, 0, -6.0,	0, -2);

			scr_add_mockup_character(spr_gumbot_right_walk,	4, 4, 440, 444, 1.1, 0);
			break;
		
		case mockup.graveyard_hi_res:
			scr_remove_mockups();
			scr_camera_set_scale(1);

			scr_add_mockup_scroll_layer(spr_graveyard_sky,				1, 1, 0, 0, 0,		0, 6);
			scr_add_mockup_scroll_layer(spr_graveyard_far_hills,		1, 1, 0, 0, -0.8,	0, 5);
			scr_add_mockup_scroll_layer(spr_graveyard_middle_hills,		1, 1, 0, 0, -1.4,	0, 4);
			scr_add_mockup_scroll_layer(spr_graveyard_close_hills,		1, 1, 0, 0, -2.0,	0, 3);
			scr_add_mockup_scroll_layer(spr_graveyard_bg,				1, 1, 0, 0, -3.0,	0, 2);
			scr_add_mockup_scroll_layer(spr_graveyard_main,				1, 1, 0, 0, -4.0,	0, 1);
			scr_add_mockup_scroll_layer(spr_graveyard_fg,				1, 1, 0, 0, -5.0,	0, -1);

			scr_add_mockup_character(spr_ninja_right_run, 1, 1, 537, 640, 1, 0);
			break;
		
		case mockup.space_lo_bit_lo_res:
			scr_remove_mockups();
			scr_camera_set_scale(2);

			scr_add_mockup_scroll_layer(spr_space_game_stars_bg,		1, 1, 0, 0, 0,	0.1, 6);
			scr_add_mockup_scroll_layer(spr_space_game_stars_closer,	1, 1, 0, 0, 0,	0.15, 5);
			scr_add_mockup_scroll_layer(spr_space_game_nebulas,			1, 1, 0, 0, 0,	0.2, 4);
			scr_add_mockup_scroll_layer(spr_space_game_stars_closest,	1, 1, 0, 0, 0,	0.3, 3);
			scr_add_mockup_scroll_layer(spr_space_game_planet_far,		1, 1, 0, 0, 0,	1.0, 2);
			scr_add_mockup_scroll_layer(spr_space_game_planet_close,	1, 1, 0, 0, 0,	2.0, 1);
			scr_add_mockup_scroll_layer(spr_space_game_comets,			1, 1, 0, 0, 0,	8, -1);

			scr_add_mockup_character(spr_spaceship_idle, 1, 1, 224, 288, 1, 0);
			break;
		
		case mockup.space_lo_bit_hi_res:
			scr_remove_mockups();
			scr_camera_set_scale(1);

			scr_add_mockup_scroll_layer(spr_space_game_stars_bg,		2, 2, 0, 0, 0,	0.2, 6);
			scr_add_mockup_scroll_layer(spr_space_game_stars_closer,	2, 2, 0, 0, 0,	0.3, 5);
			scr_add_mockup_scroll_layer(spr_space_game_nebulas,			2, 2, 0, 0, 0,	0.4, 4);
			scr_add_mockup_scroll_layer(spr_space_game_stars_closest,	2, 2, 0, 0, 0,	0.6, 3);
			scr_add_mockup_scroll_layer(spr_space_game_planet_far,		2, 2, 0, 0, 0,	2.0, 2);
			scr_add_mockup_scroll_layer(spr_space_game_planet_close,	2, 2, 0, 0, 0,	4.0, 1);
			scr_add_mockup_scroll_layer(spr_space_game_comets,			2, 2, 0, 0, 0,	16, -1);

			scr_add_mockup_character(spr_spaceship_idle, 2, 2, 448, 576, 1, 0);
			break;
		
	}

	scr_camera_reset_target();


}
