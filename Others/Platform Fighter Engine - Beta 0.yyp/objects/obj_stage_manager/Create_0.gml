/// @description Stage Features
#region Initialize variables
background = [[back_clear]];
stage_script = -1;
music = -1;
music_intro_pos = 0;
music_loop_pos = 0;
global.daynight_cycle_enable = false;
audio_stop_all();
audio_group_load(audiogroup_music);
#endregion
switch(room)
	{
	case rm_Campground:
		background = 
			[
			define_background_script(back_campground_distant, 0, 0, 2, 0, 0, 0, 0, false, 0, stage_campground_distant_draw),		
			define_background(back_campground_trees1, 0, 32, 2, 0.3, 0.3),
			define_background(back_campground_trees2, 0, 96, 2, 0.5, 0.5),
			define_background(back_campground_trees3, 0, 132, 2, 0.7, 0.7),
			[back_clear],
			];
		stage_script = -1;
		stage_set_music(song_forest);
		global.daynight_cycle_enable = true;
		break;
		
	case rm_Large_Campground:
		background = 
			[
			define_background_script(back_campground_distant, 0, 0, 2, 0, 0, 0, 0, false, 0, stage_campground_distant_draw),
			define_background(back_campground_trees1, 0, 64, 2, 0.1, 0.1),
			define_background(back_campground_trees2, 0, 118, 2, 0.2, 0.3),
			define_background(back_campground_trees3, 0, 158, 2, 0.5, 0.5),
			[back_clear],
			define_background(back_campground_flowers, 856, 704, 2, 0, 0, 0, 0, true, 0.1),
			];
		stage_script = -1;
		stage_set_music(song_forest);
		global.daynight_cycle_enable = true;
		break;
		
	case rm_Peak:
		background = 
			[
			define_background(back_peak_distant, 0, 0, 2, 0.05, 0.05),
			[back_clear],
			];
		stage_script = stage_peak_snow;
		stage_set_music(song_snow, 25.425, 94.588);
		global.daynight_cycle_enable = false;
		break;
		
	case rm_Battlefield:
		background = 
			[
			define_background(back_battlefield_distant, 0, 0, 1, 0, 0),
			define_background(back_battlefield_clouds, 0, 0, 1, 0, 0, 0.1, 0),
			define_background(back_battlefield_clouds, 0, 0, 1.2, 0, 0, 0.5, 0),
			[back_clear],
			define_background(back_battlefield_floating, 0, 0, 1, 0.5, 0.5),
			];
		stage_script = -1;
		stage_set_music(song_battlefield);
		global.daynight_cycle_enable = false;
		break;
	}
	
half_room_width = room_width / 2;
half_room_height = room_height/ 2;

//Special Effects
background_clear_frame = 0;
background_clear_amount = 0;
background_clear_fade_speed = 1;
background_clear_color = c_white;
uni_black = shader_get_uniform(shd_fade, "fade_amount");

//Layer fade for all layers that start with "asset"
var _lay = layer_get_all();
for(var i = 0; i < array_length_1d(_lay); i++)
	{
	if (string_count("Asset", layer_get_name(_lay[i])) > 0)
		{
		layer_script_begin(_lay[i], Layer_Fade_Begin);
		layer_script_end(_lay[i], Layer_Fade_End);
		}
	}