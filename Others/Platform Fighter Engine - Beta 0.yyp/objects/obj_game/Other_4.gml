/// @description Initialize
//Spawn all players and assigns controllers
Spawn_Players();

//Player render order
player_depth_list = ds_list_create();
with(obj_player)
	{
	ds_list_add(other.player_depth_list, id);
	}
	
//Finishing initializing all players
with(obj_player)
	{
	Player_Init_End();
	}

//Set the state
state = GAME_STATE.startup;

//Camera
view_enabled[0] = true;
view_visible[0] = true;
view_wport[0] = camera_width;
view_hport[0] = camera_height;
cam = global.game_cam;
view_camera[0] = cam;
cam_x = 0;
cam_y = 0;
cam_x_goal = 0;
cam_y_goal = 0;
cam_shake_h = 0;
cam_shake_v = 0;
cam_w = camera_width;
cam_h = camera_height;
cam_w_goal = cam_w;
cam_h_goal = cam_h;

//Center the camera on the players
Camera_Average();
cam_x = cam_x_goal;
cam_y = cam_y_goal;
camera_set_view_pos(cam, cam_x, cam_y);

//Game surface
game_surface = surface_create(window_width, window_height);

//Set up the hitbox priority queue
hitbox_priority_queue = ds_priority_create();

//Frame advance
current_frame = 0;
game_time = 0;
frames_advanced = 0;
draw = true;
frame_advance_active = false;
go_to_next_frame = false;

//Pause menu
pause_menu_choices = 
	[
	"Resume",
	"Frame Advance",
	"Exit",
	];
pause_menu_current = 0;
pause_menu_owner = noone;
pause_menu_stick_frame = 0;
pause_menu_canceled = false;

//Cache some values
number_of_players = instance_number(obj_player);
status_bar_space = (camera_width div (number_of_players + 1));
player_status_y = (camera_height - player_status_padding_bottom);

//Shader uniforms
palette_shader_simple_init();

//Daynight
uni_red = shader_get_uniform(shd_daynight, "red");
uni_green = shader_get_uniform(shd_daynight, "green");
uni_blue = shader_get_uniform(shd_daynight, "blue");

daynight_r = 0;
daynight_g = 0;
daynight_b = 0;
daynight_time = 0;

//Startup counter
countdown = count_time * 4;

//Ending counter
endcount = 0;

//Replays
global.replay_data[? "SEED"] = random_get_seed();

//Clear buffer for each player
if (!global.replay_mode)
	{
	for(var i = 0; i < max_players; i++)
		{
		var _buffer = global.game_replay[| i];
		buffer_reset(_buffer);
		}
	}	
	
//Load replay for playback
if (global.replay_mode)
	{
	//Players must start at the beginning of their buffers
	with(obj_player)
		{
		var _buffer = global.game_replay[| player_number];
		buffer_seek(_buffer, buffer_seek_start, 0);
		}
	}
	
//Audio
audio_group_set_gain(audiogroup_music, global.volume_music, 0);
audio_group_set_gain(audiogroup_sound_effects, global.volume_sound_effects, 0);