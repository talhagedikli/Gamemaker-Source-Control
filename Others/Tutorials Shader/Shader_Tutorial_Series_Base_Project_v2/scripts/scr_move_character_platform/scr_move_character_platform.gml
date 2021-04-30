function scr_move_character_platform() {
	//-----------------------------------------------------------------------------
	/// @edescription Moves a character in a platformer environment
	//-----------------------------------------------------------------------------

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	Needs to be set up in create event with the script:
		scr_setup_character_platform(...);
	
	All descriptions are in that script as well	

	//-----------------------------------------------------------------------------
		Credits:
	//-----------------------------------------------------------------------------
	This code is heavily based on Shaun Spaldings platformer tutorial:
	Playlist:	https://www.youtube.com/playlist?list=PLPRT_JORnIupqWsjRpJZjG07N01Wsw_GJ
	Patreon:	https://www.patreon.com/shaunjs
	//---------------------------------------------------------------------------*/

	var hspd, dir, jump, on_floor;

	// GET INPUT:
	//-----------------------------------------------------------------------------

	if (global.mobile) { // Mobile controls: tilt and LMB, gamepad
		var tilt= device_get_tilt_y();
		dir		= abs(tilt) > 0.15 ? sign(tilt) : 0;		// tilt
		dir		+= (global.key_right - global.key_left);		// gamepad
		jump	= global.key_jump || device_mouse_check_button_pressed(0, mb_left) * !global.mouse_on_gui; // touch & gamepad
	} else { // PC Controls: keyboard, gamepad, mouse
		if(mouse_check_button(mb_left) && !global.mouse_on_gui)
			dir	= (abs(mouse_x - x_real) > move_spd) ? sign(mouse_x - x_real) : 0;
		else
			dir	= (global.key_right - global.key_left);

		jump	=	global.key_jump || device_mouse_check_button_pressed(0, mb_right);
	}


	// SET MOVMENT:
	//-----------------------------------------------------------------------------
	hspd = dir * move_spd;

	vspd = vspd + grav;

	if (jump) {
		if (place_meeting(x_real, y_real + 1, obj_wall)) {
			vspd = -jump_spd;
		} else if (double_jumped == false) {
			vspd = -jump_spd;
			double_jumped = true;
		}
	}



	// HORIZONTAL COLLISION:
	//-----------------------------------------------------------------------------
	if (place_meeting(x_real + hspd, y_real, obj_wall)) {
		while(!place_meeting(x_real + dir, y_real, obj_wall))
			x_real += dir;
		hspd = 0;
	}
	x_real += hspd;
	


	// VERTICAL COLLISION:
	//-----------------------------------------------------------------------------
	if (place_meeting(x_real, y_real + vspd, obj_wall)) {
		while(!place_meeting(x_real, y_real + sign(vspd), obj_wall))
			y_real += sign(vspd);
		vspd = 0;
	}
	y_real += vspd;



	// SET SPRITE:
	//-----------------------------------------------------------------------------

	// Airborne:
	if (!place_meeting(x_real, y_real + 1, obj_wall)) {
		sprite_index	= player_sprite_R_jump;
		image_speed		= 0;
		image_index		= (vspd < 0) ? 0 : 1;
	}

	// On Floor:
	else {
		image_speed		= img_spd;
		sprite_index	= (dir == 0) ? player_sprite_R_idle : player_sprite_R_walk;
		double_jumped	= false;
	}

	// Facing:
	if (dir != 0)
		image_xscale = sign(dir) * img_scale;


	// Position:
	x					= round(x_real);
	y					= round(y_real);


}
