function scr_setup_character_leftright() {
	//-----------------------------------------------------------------------------
	/// @edescription Quickly sets up a character with left-right movement
	//-----------------------------------------------------------------------------
	/// @param spr_idle
	/// @param spr_R_walk
	/// @param spr_mask
	/// @param img_scale
	/// @param move_spd
	///	@param img_spd

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	To actually move the character implement the script:
		scr_move_character_leftright();
	and call this line in a step event:
		script_execute(movement_script);
	
	Facing:	The left-facing sprite will just be a mirrored version of the
			right-facing sprite.

	Idle:	The idle sprite would usually be facing out of the screen at the user.

	//-----------------------------------------------------------------------------
		Movement:
	//-----------------------------------------------------------------------------
	Keyboard:	AD, Arrows
	Gamepad:	D-Pad, L-Stick
	Mouse:		Moves towards mouse when LMB is down
	Touch:		Moves towards finger while touching

	//-----------------------------------------------------------------------------
		Example:
	//-----------------------------------------------------------------------------
	Create Event:
	-------------
		scr_setup_character_leftright(	spr_spaceship_idle,
										spr_spaceship_right,
										1, 4, 1);

	A Step Event:
	-------------
		script_execute(movement_script);

	This will turn the calling instance into a playable character which can move
	left and right only.

	The sprite will be unscaled, the movement speed is 4px in room space per
	frame and the animation speed is left as it was set in the sprites.

	//---------------------------------------------------------------------------*/

	// ARGUMENTS:
	//-----------------------------------------------------------------------------
	var arg			= 0;
	var spr_idle	= argument[arg++];
	var spr_R_walk	= argument[arg++];
	var spr_mask	= argument[arg++];
	var img_scale_	= argument[arg++];
	var move_spd_	= argument[arg++];
	var img_spd_	= argument[arg++];


	// SPRITE[0: idle | 1: walk]
	//-----------------------------------------------------------------------------
	player_sprite[0]		= spr_idle;
	player_sprite[1]		= spr_R_walk;

	sprite_index			= player_sprite[0];
	shadow_sprite			= -1;

	// IMAGE:
	//-----------------------------------------------------------------------------
	img_scale				= img_scale_;
	image_xscale			= img_scale_;
	image_yscale			= img_scale_;
	image_speed				= img_spd_;
	mask_index				= spr_mask;

	// MOVEMENT:
	//-----------------------------------------------------------------------------
	move_spd				= move_spd_;
	movement_script			= scr_move_character_leftright;
	x_real					= x;




}
