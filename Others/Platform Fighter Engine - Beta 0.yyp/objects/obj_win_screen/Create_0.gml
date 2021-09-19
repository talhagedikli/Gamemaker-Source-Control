/// @description
offset = 100;

character = get_player_data(global.win_screen_player, PLAYER_DATA.character);
name = get_char_data(character, CHAR_DATA.name);
palette = get_char_data(character, CHAR_DATA.palette);
color_index = get_player_data(global.win_screen_player, PLAYER_DATA.color);
color = palette_get_color(get_char_data(character, CHAR_DATA.palette_data), 0, color_index);
render = get_char_data(character, CHAR_DATA.render);

palette_shader_simple_init();

//Replays
can_save_replay = global.replay_record;

//Voronoi
var _r = color_get_red	(color) / $FF;
var _g = color_get_green(color) / $FF;
var _b = color_get_blue	(color) / $FF;
var _d = 0.3;

Voronoi_Change_Color
	(
	[_r - random(_d), _r + random(_d)],
	[_g - random(_d), _g + random(_d)], 
	[_b - random(_d), _b + random(_d)],
	);
	
//Stop all sound
audio_stop_all();