function scr_setup_character_platform() {
	//-----------------------------------------------------------------------------
	/// @edescription Quickly sets up a character with platform movement
	//-----------------------------------------------------------------------------
	/// @param spr_R_idle
	/// @param spr_R_walk
	/// @param spr_R_jump
	/// @param spr_mask
	/// @param img_scale
	/// @param move_spd
	///	@param img_spd
	/// @param jump_spd
	/// @param grav

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	To actually move the character implement the script:
		scr_move_character_platform();
	and call this line in a step event:
		script_execute(movement_script);
	
	Facing:	All the left-facing sprites will just be mirrored versions of the
			right-facing sprites.

	Mask:	The mask sprite sets the mask for all directions

	//-----------------------------------------------------------------------------
		Movement:
	//-----------------------------------------------------------------------------
	Keyboard:	AD, Arrows LR	to move
				Space, Arrow up	to jump
	Gamepad:	D-Pad, L-Stick	to move
				F1 / A / Cross	to jump
	Mouse:		LMB				to move
				RMB				to jump
	Touch:		Tilt			to move
				Touch			to jump

	Allows double jumping and one jump if falling.

	//-----------------------------------------------------------------------------
		Example:
	//-----------------------------------------------------------------------------
	Create Event:
	-------------
		scr_setup_character_platform(	spr_red_cap_right_idle,
										spr_red_cap_right_walk,
										spr_red_cap_right_jump,
										spr_red_cap_platform_mask,
										3, 3, 1, 6, 0.1);

		A Step Event:
	-------------
	script_execute(movement_script);

	This will turn the calling instance into a playable character in a platformer game.
	The collision mask will be taken from spr_red_cap_platform_mask.

	The sprite will be scaled up by factor 3, the movement speed is 3px in room space 
	per frame and the animation speed is left as it was set in the sprites.

	When jumping, vertical speed is 6px in room space per frame (upards) and
	gravitation will reduce that by 0.1 per frame.

	//---------------------------------------------------------------------------*/

	// ARGUMENTS:
	//-----------------------------------------------------------------------------
	var arg					= 0;
	var spr_R_idle			= argument[arg++];
	var spr_R_walk			= argument[arg++];
	var spr_R_jump			= argument[arg++];
	var spr_mask			= argument[arg++];
	var img_scale_			= argument[arg++];
	var move_spd_			= argument[arg++];
	var img_spd_			= argument[arg++];
	var jump_spd_			= argument[arg++];
	var grav_				= argument[arg++];


	// SPRITE[0: idle | 1: walk | 2: jump]
	//-----------------------------------------------------------------------------
	player_sprite_R_idle	= spr_R_idle;
	player_sprite_R_walk	= spr_R_walk;
	player_sprite_R_jump	= spr_R_jump;

	sprite_index			= player_sprite_R_idle;
	shadow_sprite			= -1


	// IMAGE:
	//-----------------------------------------------------------------------------
	img_scale				= img_scale_;
	image_xscale			= img_scale_;
	image_yscale			= img_scale_;
	image_speed				= 0;
	img_spd					= img_spd_;
	mask_index				= spr_mask;


	// MOVEMENT:
	//-----------------------------------------------------------------------------
	move_spd				= move_spd_;
	movement_script			= scr_move_character_platform;
	x_real					= x;
	y_real					= y;

	jump_spd				= jump_spd_;
	double_jumped			= false;
	grav					= grav_;
	vspd					= 0; // current vspd, changes when airborne

	// MISC:
	//-----------------------------------------------------------------------------
	os_lock_orientation(true);


}
