/// @description CONTROL ALL GAME OBJECTS
/*----------------------------------------------------------------*/

if (state == GAME_STATE.normal || state == GAME_STATE.startup || (state == GAME_STATE.paused && go_to_next_frame))
	{
	/*TIMERS*/
	current_frame++;
	game_time += (state != GAME_STATE.startup ? 1 : 0);
	frames_advanced++;
	draw = true;
	
	/*UPDATE ALL MOVING PLATFORMS*/
	with(obj_block_moving)
		{
		event_user(user_event_step);
		}
	
	/*UPDATE ALL PLAYERS*/
	with(obj_player)
		{
		event_user(user_event_step);
		}
		
	/*UPDATE ALL ENTITIES*/
	with(obj_entity)
		{
		event_user(user_event_step);
		}
		
	/*UPDATE ALL HURTBOXES*/
	with(obj_hurtbox)
		{
		event_user(user_event_step);
		}
		
	/*CALCULATE HITBOX ORDER*/
	//Add all of the hitboxes to the priority queue to sort
	with(obj_hitbox)
		{
		ds_priority_add(other.hitbox_priority_queue, id, id + priority);
		}
		
	//Based on the priority queue
	while(!ds_priority_empty(hitbox_priority_queue))
		{
		with(ds_priority_delete_min(hitbox_priority_queue))
			{
			event_user(user_event_step);
			}
		}
		
	/*UPDATE ALL EFFECTS*/
	with(obj_fx)
		{
		event_user(user_event_step);
		}
	part_system_update(global.part_sys);
	
	/*CAMERA*/
	Camera_Average();
	
	/*BACKGROUND FADE*/
	with(obj_stage_manager)
		{
		event_user(user_event_step);
		}
		
	/*KNOCKOUTS*/
	//Getting KO'ed
	with(obj_player)
		{
		if (!is_dead())
			{
			if (check_blastzones(0, 0, room_width, room_height))
				{
				die();
				}
			}
		}
	
	//Stop frame advance
	if (go_to_next_frame && frame_advance_active)
		{
		go_to_next_frame = false;
		}
	}
else
	{
	//No new drawing
	draw = false;
	
	/*UPDATE ALL INPUT BUFFERS*/
	//Update Input Buffer when on frame advance; Inputs are taken on the frame it is unpaused.
	if (state == GAME_STATE.paused && frame_advance_active)
		{
		with(obj_player)
			{
			event_user(user_event_paused);
			}
		}
	}
	
/*----------------------------------------------------------------*/
#region Pause
if (state == GAME_STATE.normal && !pause_menu_canceled && !global.replay_mode && allow_pausing)
	{
	with(obj_player)
		{
		if (button(INPUT.pause, 0))
			{
			with(other)
				{
				state = GAME_STATE.paused;
				frames_advanced = 0;
				pause_menu_current = 0;
				pause_menu_owner = other.id;
				}
			break;
			}
		}
	}
else if (pause_menu_canceled)
	{
	//If the pause menu has just been canceled, players will not be able to open it up on the next frame
	pause_menu_canceled = false;
	with(obj_player)
		{
		button_reset(INPUT.pause);
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region Pause Menu
if (state == GAME_STATE.paused)
	{
	if (!frame_advance_active)
		{
		//Input
		var _c = pause_menu_owner.device;
		var _type = pause_menu_owner.device_type;
		var _ud = 0;
		if ((_type == DEVICE.controller && abs(gamepad_axis_value(_c, gp_axislv)) > stick_flick_amount) ||
			(_type == DEVICE.keyboard && sign(keyboard_check(menu_down_key) + keyboard_check(menu_up_key)) != 0))
			{
			pause_menu_stick_frame++;
			if (pause_menu_stick_frame == 1 ||
				(pause_menu_stick_frame > VB_inital_time && 
				pause_menu_stick_frame % VB_loop_time == 0))
				{
				if (_type == DEVICE.controller)
					{
					_ud = sign(gamepad_axis_value(_c, gp_axislv));
					}
				else if (_type == DEVICE.keyboard)
					{
					_ud = keyboard_check(menu_down_key) - keyboard_check(menu_up_key);
					}
				}
			}
		else
			{
			pause_menu_stick_frame = 0;
			}
		if (_type == DEVICE.controller)
			{
			_s = gamepad_button_check_pressed(_c, menu_confirm_button);
			}
		else if (_type == DEVICE.keyboard)
			{
			_s = keyboard_check_pressed(menu_confirm_key);
			}
		//Logic
		pause_menu_current = modulo(pause_menu_current + _ud, array_length_1d(pause_menu_choices));
		if (_s)
			{
			switch(pause_menu_current)
				{
				case 0:
					state = GAME_STATE.normal;
					pause_menu_owner = noone;
					pause_menu_canceled = true;
					break;
				case 1:
					frame_advance_active = true;
					break;
				case 2:
					Match_End(rm_CSS);
					exit;
				}
			}
		}
	else
		{
		//Frame advance
		var _c = pause_menu_owner.device;
		var _type = pause_menu_owner.device_type;
		var _a = 0, _s = 0;
		if (_type == DEVICE.controller)
			{
			_a = gamepad_button_check_pressed(_c, menu_frame_advance_cancel_button);
			_s = gamepad_button_check_pressed(_c, menu_frame_advance_step_button);
			}
		else if (_type == DEVICE.keyboard)
			{
			_a = keyboard_check_pressed(menu_frame_advance_cancel_key);
			_s = keyboard_check_pressed(menu_frame_advance_step_key);
			}
		if (_a)
			{
			frame_advance_active = false;
			}
		else
			{
			go_to_next_frame = _s;
			}
		}
	}
#endregion	
/*----------------------------------------------------------------*/
#region Startup countdown
countdown = max(--countdown, 0);
if (state == GAME_STATE.startup)
	{
	//Timer until the start
	if (countdown <= count_time)
		{
		state = GAME_STATE.normal;
		with(obj_player)
			{
			set_state(PLAYER_STATE.idle);
			}
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region Ending countdown
if (state == GAME_STATE.ending)
	{
	//Counter
	endcount = max(--endcount, 0);
	//Play out all FX at half speed
	if (endcount % 2 == 0)
		{
		with(obj_fx)
			{
			event_user(user_event_step);
			}
		part_system_update(global.part_sys);
		}
	//Timer under the end
	if (endcount <= count_time)
		{
		//Save the replay
		if (!global.replay_mode && global.replay_record)
			{
			global.replay_data[? "TIME"] = Timestamp_Create();
			game_replay = -1;
			}
			
		//To Win Screen
		Match_End();
		}
	}
#endregion
/*----------------------------------------------------------------*/
#region Daynight Cycle Values
//Calculate the RGB values for Day / Night
daynight_time = (current_frame / 40) % 100;
var _time = daynight_time;

//Normal
if (_time < 30)
	{
	daynight_r = 0;
	daynight_g = 0;
	daynight_b = 0;
	}
//Dusk
else if (_time < 50)
	{
	var _amt = (_time - 30) / 20;
	daynight_r = lerp(0, 0.25, _amt);
	daynight_g = lerp(0, -0.1, _amt);
	daynight_b = lerp(0, 0.1, _amt);
	}
//Night
else if (_time < 80)
	{
	var _amt = (_time - 50) / 30;
	daynight_r = lerp(0.25, -0.4, _amt);
	daynight_g = lerp(-0.1,-0.3,_amt);
	daynight_b = lerp(0.1, -0.1, _amt);
	}
//Dawn
else if (_time < 100)
	{
	var _amt = (_time - 80) / 20;
	daynight_r = lerp(-0.4, 0, _amt);
	daynight_g = lerp(-0.3, 0, _amt);
	daynight_b = lerp(-0.1, 0, _amt);
	}
#endregion