///@func Input_Buffer_Update_Replay(buffer_index,count)
///@param buffer_index
///@param count
///Can only be called by players
var _buffer, _cc, _count;
_buffer = argument[0];
_cc = custom_controls;
_count = argument[1];
//Update input buffer
#region Input Buffer Count
if (_count)
	{
	//Counts for each input
	for(var i = 0; i < (INPUT.length * 2); i++)
		{
		_buffer[| i] = min(++_buffer[| i], max_buffer_length);
		}
	}
#endregion
#region Check the replay data
//Get the buffer
var _load = global.game_replay[| player_number];
#endregion
#region Update
//Loop through the inputs
var _flag = buffer_read(_load, buffer_u32);
for(var i = 0; i < (INPUT.length * 2); i++)
	{
	if (bitflag_read(_flag, i))
		{
		_buffer[| i] = 0;
		}
	}

//Control stick
var _lx = real(buffer_read(_load, buffer_f64)),
	_ly = real(buffer_read(_load, buffer_f64)),
	_rx = real(buffer_read(_load, buffer_f64)),
	_ry = real(buffer_read(_load, buffer_f64));
	
Stick_Cache_Values(Rstick, _rx, _ry, _count);
var _dist = stick_get_distance(Rstick);
if (_dist > rstick_flick_amount &&
	stick_get_speed(Rstick) > rstick_flick_speed &&
	control_flicked_r > stick_flick_cooldown)
	{
	control_flicked_r = 0;
	}
if (_dist > rstick_tilt_amount)
	{
	control_tilted_r = 0;
	}
Stick_Cache_Values(Lstick, _lx, _ly, _count);
var _dist = stick_get_distance(Lstick);
if (_dist > stick_flick_amount &&
	stick_get_speed(Lstick) > stick_flick_speed &&
	control_flicked_l > stick_flick_cooldown)
	{
	control_flicked_l = 0;
	}
if (_dist > stick_tilt_amount)
	{
	control_tilted_l = 0;
	}
#endregion

//* DEBUG
if (replay_sync_mode)
	{
	var _x = buffer_read(_load, buffer_s16);
	var _y = buffer_read(_load, buffer_s16);
	var _s = buffer_read(_load, buffer_u8);
	var _h = buffer_read(_load, buffer_f64);
	var _v = buffer_read(_load, buffer_f64);
	var _d = buffer_read(_load, buffer_f64);
	//var _h = buffer_read(_load, buffer_f64);
	if (x != _x || y != _y || state != _s || hsp != _h || vsp != _v || stick_get_direction(Lstick) != _d)
		{
		show_message(to_string
			(
			"A desync has occured. Frame: ", obj_game.current_frame, 
			". State: ", Get_Player_State_Name(state), ", should be ", Get_Player_State_Name(_s), 
			". Player number: ", player_number, 
			". X: ", x, " Y: ", y, ", should be ", _x, ", ", _y,
			". H: ", hsp, " V: ", vsp, ", should be ", _h, ", ", _v,
			". Dir: ", _d, ", should be ", stick_get_direction(Lstick),
			));
		}
	}
//*/