///Sets up the game state
function Game_Init() {
	show_debug_overlay(debug);
	randomize();
#region General

	//Global list for collision checking
	global.col_list = ds_list_create();

	//Daynight cycle - requres the game_surface_enable
	global.daynight_cycle_enable = true;

#endregion
#region Player Data

	//Player data for the win screen (temporary)
	global.win_screen_player = -1;

	//Profile data
	global.profiles = ds_list_create();
	Profile_Load_All();
	Profile_Clean_Auto();

#endregion
#region Match settings

	global.players = array_create(max_players);
	global.number_of_players = 0;
	global.match_stage = room_next(rm_CSS);
	global.match_stock = 3;
	global.match_time = 6;
	global.match_stamina = 0;
	global.match_teams = array_create(max_players, -1);
	global.match_team_attack = false;
	global.css_token_positions = array_create(max_players);

#endregion
#region Replays

	//Replay mode
	global.replay_mode = false;
	global.replay_record = true;
	global.replay_data = ds_map_create();
	global.game_replay = ds_list_create();

	//Add in a buffer for each player
	for(var i = 0; i < max_players; i++)
		{
		var _buffer = buffer_create(1, buffer_grow, 1);
		ds_list_add(global.game_replay, _buffer);
		}
	
	ds_map_add_list(global.replay_data, "DATA", global.game_replay);
	global.replay_data[? "SEED"] = random_get_seed();
	global.replay_data[? "TIME"] = Timestamp_Create();

#endregion
#region Particles

	//Global particle system
	global.part_sys = part_system_create();
	Part_System_Init();

#endregion
#region Cameras and Views

	//Game resizing
	surface_resize(application_surface,camera_width,camera_height);
	window_set_size(camera_width,camera_height);
	window_set_position
		(
		display_get_width() div 2 - camera_width div 2,
		display_get_height() div 2 - camera_height div 2
		);

	//Game camera
	view_enabled[0] = true;
	view_visible[0] = true;
	view_wport[0] = camera_width;
	view_hport[0] = camera_height;
	global.game_cam = camera_create_view(0, 0, camera_width, camera_height);
	view_camera[0] = global.game_cam;

#endregion
#region Sounds

	global.volume_music = 1;
	global.volume_sound_effects = 1;
	audio_group_load(audiogroup_music);
	audio_group_load(audiogroup_sound_effects);
	audio_group_set_gain(audiogroup_music, global.volume_music, 0);
	audio_group_set_gain(audiogroup_sound_effects, global.volume_sound_effects, 0);

#endregion


}
