function scr_move_character_leftright() {
	//-----------------------------------------------------------------------------
	/// @edescription Moves a character left-right
	//-----------------------------------------------------------------------------

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	Needs to be set up in create event with the script:
		scr_setup_character_leftright(...);
	
	All descriptions are in that script as well	
	//---------------------------------------------------------------------------*/

	// GET INPUT & SET MOVEMENT:
	//-----------------------------------------------------------------------------
	var hspd, dir;

	if(mouse_check_button(mb_left) && !global.mouse_on_gui) {
		dir = (abs(mouse_x - x_real) > move_spd) ? sign(mouse_x - x_real) : 0;
	} else
		dir = (global.key_right - global.key_left);

	hspd = dir * move_spd;



	// HORIZONTAL COLLISION:
	//-----------------------------------------------------------------------------
	if (hspd != 0) {
		if (place_meeting(x_real + hspd, y, obj_wall)) {
			while(!place_meeting(x_real + sign(hspd), y, obj_wall))
				x_real += sign(hspd);
			hspd = 0;
		}
		x_real += hspd;
	}



	// SET SPRITE:
	//-----------------------------------------------------------------------------
	x				= round(x_real);
	sprite_index	= player_sprite[abs(dir)];
	image_xscale	= (dir != 0) ? img_scale * dir : img_scale;




}
