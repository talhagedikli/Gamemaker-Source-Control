function scr_move_character_topdown() {
	//-----------------------------------------------------------------------------
	/// @edescription Moves a character in a top-down environment
	//-----------------------------------------------------------------------------

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	Needs to be set up in create event with the script:
		scr_setup_character_topdown(...);
	
	All descriptions are in that script as well	
	//---------------------------------------------------------------------------*/

	// GET INPUT:
	//-----------------------------------------------------------------------------
	var dir, dis, hspd, vspd;

	if(mouse_check_button(mb_left) && !global.mouse_on_gui) {
		dir = point_direction(x_real, y_real, mouse_x, mouse_y);
		dis = point_distance(x_real, y_real, mouse_x, mouse_y) - move_spd;
	} else {	
		var hor = global.key_right - global.key_left;
		var ver = global.key_down  - global.key_up;
		dir = point_direction(0, 0, hor, ver);
		dis = point_distance( 0, 0, hor, ver); 
	}



	// SET MOVMENT:
	//-----------------------------------------------------------------------------
	if (dis > 0) {
		hspd = lengthdir_x(move_spd, dir);
		vspd = lengthdir_y(move_spd, dir);
		facing = (dir+45) div 90 mod 4;
		moving = true;
	} else {
		hspd = 0;
		vspd = 0;
		moving = false;
	}



	// HORIZONTAL COLLISION:
	//-----------------------------------------------------------------------------
	if (dis > 0) {
		if (place_meeting(x_real + hspd, y_real, obj_wall)) {
			while(!place_meeting(x_real + sign(hspd), y_real, obj_wall))
				x_real += sign(hspd);
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
	}



	// SET SPRITE:
	//-----------------------------------------------------------------------------

	x				= round(x_real);
	y				= round(y_real);
	sprite_index	= player_sprite[moving, facing];
	image_xscale	= (facing == 2) ? img_scale * -1 : img_scale;



}
