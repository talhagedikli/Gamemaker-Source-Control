///@func check_tech()
///@desc Allows the player to tech. Should only be used in moving scripts.

var _result = TECH_RESULT.slide;
var _spd = point_distance(0, 0, hsp, vsp);
var _dir = point_direction(0, 0, hsp, vsp);
var _tech_input = false;
if (tech_buffer < tech_buffer_time && can_tech)
	{
	_tech_input = true;
	}

//Ground Collision
if (on_ground() && vsp > 0)
	{
	if (_tech_input)
		{
		//Reset tech buffer
		tech_buffer = tech_lockout_time;
		//Tech roll
		if (stick_tilted(Lstick, DIR.horizontal))
			{
			set_state(PLAYER_STATE.techrolling);
			state_phase = 0;
			state_frame = techroll_startup;
			state_direction = sign(stick_get_value(Lstick, DIR.horizontal));
			hurtbox_set_inv(hurtbox, INV.invincible, techroll_startup);
			}
		//Tech in place
		else
			{
			set_state(PLAYER_STATE.teching);
			state_phase = 0;
			state_frame = tech_active;
			hurtbox_set_inv(hurtbox, INV.invincible, tech_active);
			}
		_result = TECH_RESULT.success;
		}
	//Missed tech
	else
		{
		//Bounce
		if (_spd >= bounce_minimum_speed)
			{
			//Slopes
			var _slope = collision(x, y + 1, flags_create(FLAG.slope));
			if (_slope != noone)
				{
				var _newspd = (_spd * bounce_speed_multiplier);
				var _newdir = bounce_angle(_dir, _slope.slope_angle);
				set_speed(lengthdir_x(_newspd, _newdir), lengthdir_y(_newspd, _newdir), false, false);
				}
			else
				{
				vsp = (-vsp * bounce_speed_multiplier);
				}
			_result = TECH_RESULT.bounce;
			}
		//Slide
		else
			{
			set_state(PLAYER_STATE.in_lag);
			state_frame = hard_landing_lag;
			vsp = 0;
			vsp_frac = 0;
			_result = TECH_RESULT.slide;
			}
		}
	}
//Wall Collision
else if ((collision(x + 1, y, flags_create(FLAG.solid)) || collision(x - 1, y, flags_create(FLAG.solid))) && hsp != 0)
	{
	if (_tech_input)
		{
		//Reset tech buffer
		tech_buffer = tech_lockout_time;
		//Wall Tech Jump
		if (button(INPUT.jump) || button_hold(INPUT.jump) || stick_tilted(Lstick, DIR.up))
			{
			facing = (collision(x + 1, y, flags_create(FLAG.solid)) ? -1 : 1);
			set_state(PLAYER_STATE.tech_wall_jump);
			state_phase = 0;
			state_frame = wall_jump_startup;
			}
		//Wall Tech
		else
			{
			set_state(PLAYER_STATE.teching);
			set_anim(my_sprites[? "TechingW"]);
			state_phase = 0;
			state_frame = tech_active;
			hurtbox_set_inv(hurtbox, INV.invincible, tech_active);
			}
		_result = TECH_RESULT.success;
		}
	//Missed tech
	else
		{
		//Bounce
		if (_spd >= bounce_minimum_speed)
			{
			//Slopes
			var _slope = collision(x + sign(hsp), y, flags_create(FLAG.slope));
			if (_slope != noone)
				{
				var _newspd = (_spd * bounce_speed_multiplier);
				var _newdir = bounce_angle(_dir, _slope.slope_angle);
				set_speed(lengthdir_x(_newspd, _newdir), lengthdir_y(_newspd, _newdir), false, false);
				}
			else
				{
				hsp = (-hsp * bounce_speed_multiplier);
				}
			_result = TECH_RESULT.bounce;
			}
		//Slide
		else 
			{
			hsp = 0;
			hsp_frac = 0;
			_result = TECH_RESULT.slide;
			}
		}
	}
//Ceiling Collision
else if (collision(x, y - 1, flags_create(FLAG.solid)) && vsp < 0)
	{
	if (_tech_input)
		{
		//Reset tech buffer
		tech_buffer = tech_lockout_time;
		//Ceiling tech
		set_state(PLAYER_STATE.teching);
		set_anim(my_sprites[? "TechingC"]);
		state_phase = 0;
		state_frame = tech_active;
		hurtbox_set_inv(hurtbox, INV.invincible, tech_active);
		_result = TECH_RESULT.success;
		}
	//Missed tech
	else
		{
		//Bounce
		if (_spd >= bounce_minimum_speed)
			{
			//Slopes
			var _slope = collision(x, y - 1, flags_create(FLAG.slope));
			if (_slope != noone)
				{
				var _newspd = (_spd * bounce_speed_multiplier);
				var _newdir = bounce_angle(_dir, _slope.slope_angle);
				set_speed(lengthdir_x(_newspd, _newdir), lengthdir_y(_newspd, _newdir), false, false);
				}
			else
				{
				vsp = (-vsp * bounce_speed_multiplier);
				}
			_result = TECH_RESULT.bounce;
			}
		//Slide
		else
			{
			vsp = 0;
			vsp_frac = 0;
			_result = TECH_RESULT.slide;
			}
		}
	}
	
if (_result == TECH_RESULT.success)
	{
	//No speed
	set_speed(0, 0, false, false);
	//VFX
	create_fx(spr_dust_tech, 1, 0, 31, x, y, 2, irandom(360));
	//Reset tech
	tech_buffer = tech_lockout_time;
	}

return _result;