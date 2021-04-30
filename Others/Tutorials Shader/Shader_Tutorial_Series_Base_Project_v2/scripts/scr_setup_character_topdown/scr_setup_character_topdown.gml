function scr_setup_character_topdown() {
	//-----------------------------------------------------------------------------
	/// @edescription Quickly sets up a character with top-down movement
	//-----------------------------------------------------------------------------
	/// @param spr_R_idle	
	/// @param spr_R_walk
	/// @param spr_U_idle
	/// @param spr_U_walk
	/// @param spr_D_idle
	/// @param spr_D_walk
	/// @param spr_mask
	/// @param spr_shadow
	/// @param img_scale
	/// @param move_spd
	///	@param img_spd

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	To actually move the character implement the script:
		scr_move_character_topdown();
	and call this line in a step event:
		script_execute(movement_script);
	
	Facing:	All the left-facing sprites will just be mirrored versions of the
			right-facing sprites.

	Mask:	The mask sprite sets the mask for all directions

	Shadow:	-1 for no shadow

	//-----------------------------------------------------------------------------
		Movement:
	//-----------------------------------------------------------------------------
	Keyboard:	WASD, Arrows
	Gamepad:	D-PAD, L-Stick
	Mouse:		Moves towards mouse when LMB is down
	Touch:		Moves towards finger while touching

	//-----------------------------------------------------------------------------
		Example:
	//-----------------------------------------------------------------------------
	Create Event:
	-------------
		scr_setup_character_topdown(	spr_red_cap_right_idle,
										spr_red_cap_right_walk,
										spr_red_cap_up_idle,
										spr_red_cap_up_walk,
										spr_red_cap_down_idle,
										spr_red_cap_down_walk,
										spr_red_cap_topdown_mask,
										-1
										2, 4, 1);

	A Step Event:
	-------------
		script_execute(movement_script);
	
	This will turn the calling instance into a playable character in a top-down game.
	The collision mask will be taken from spr_red_cap_topdown_mask and the 
	character will have no shadow sprite.

	The sprite will be scaled up to 2, the movement speed is 4px in room space per
	frame and the animation speed is left as it was set in the sprites.
	
	//---------------------------------------------------------------------------*/

	// ARGUMENTS:
	//-----------------------------------------------------------------------------
	var arg					= 0;
	var spr_R_idle			= argument[arg++];
	var spr_R_walk			= argument[arg++];
	var spr_U_idle			= argument[arg++];
	var spr_U_walk			= argument[arg++];
	var spr_D_idle			= argument[arg++];
	var spr_D_walk			= argument[arg++];
	var spr_mask			= argument[arg++];
	var spr_shadow			= argument[arg++];
	var img_scale_			= argument[arg++];
	var move_spd_			= argument[arg++];
	var img_spd_			= argument[arg++];


	// SPRITE[moving, facing]
	//-----------------------------------------------------------------------------
	// moving: 0: false | 1: true
	// facing: 0: right | 1: up | 2: left | 3: down

	facing					= 0;
	moving					= 0;

	player_sprite[0,0]		= spr_R_idle;
	player_sprite[1,0]		= spr_R_walk;
	player_sprite[0,1]		= spr_U_idle;
	player_sprite[1,1]		= spr_U_walk;
	player_sprite[0,2]		= player_sprite[0,0];
	player_sprite[1,2]		= player_sprite[1,0];
	player_sprite[0,3]		= spr_D_idle;
	player_sprite[1,3]		= spr_D_walk;

	sprite_index			= player_sprite[moving,facing];
	shadow_sprite			= spr_shadow;


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
	movement_script			= scr_move_character_topdown;
	x_real					= x;
	y_real					= y;




}
