///@func Replay_Save(filename)
///@param filename
var _name = argument[0];
	
//Create the final buffer
var _final = buffer_create(1, buffer_grow, 1);
buffer_seek(_final, buffer_seek_start, 0);

//Write metadata
buffer_write(_final, buffer_string, global.replay_data[? "TIME"]);
buffer_write(_final, buffer_u8, $FF);
buffer_write(_final, buffer_f64, global.replay_data[? "SEED"]);

buffer_write(_final, buffer_u32, global.match_stage);
buffer_write(_final, buffer_s16, global.match_stock);
buffer_write(_final, buffer_s16, global.match_time);
buffer_write(_final, buffer_s16, global.match_stamina);
//buffer_write(_final, buffer_s16, global.match_teams);

//Write player metadata
Replay_Add_Players(_final);

//Add in other buffers
for(var i = 0; i < max_players; i++)
	{
	var _buffer = global.game_replay[| i];
	Replay_Buffer_Add_Chunk(_buffer, _final);
	}

//Export to file
buffer_resize(_final, buffer_tell(_final));
var _compress = buffer_compress(_final, 0, buffer_get_size(_final));
buffer_save(_compress, _name);
show_message(to_string("Replay saved to: ", _name));

//Destroy buffers
buffer_delete(_compress);
buffer_delete(_final);