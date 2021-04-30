/// @description Init Player
//-----------------------------------------------------------------------------
#region INFORMATION
//-----------------------------------------------------------------------------
// Use this tempalte to create a playable character.
//	- for left-right movement only or
//	- for a top-down enivironment like classig RPG or
//	- for a platformer.
//
//-----------------------------------------------------------------------------
// 
// LEFT/RIGHT SPRITE:
//-----------------------
// For simplicity reasons all the left-facing sprites will just be
// mirrored versions of the right-facing sprites.
// 
// MASKS:
//-----------------------
// Masks in top-down games are usually different from masks in platform games.
// To be able to use the same sprites for both we'll also need to specify which
// the collision mask to use.
// This could in theory be i.e. the mask of the walk-right-sprite for topdown
// games and the mask of idle-right-sprite for platform games.
// It seemed less confusing however to create two seperate mask sprites just for
// setting and getting the masks and specifiy their useage as masks only in the
// sprite name.
//
// So instead of using the mask of
//		spr_..._right_walk for topdown and
//		spr_..._right_idle for platform
//
// I decided to create a sprite called
//		spr_..._topdown_mask and
//		spr_..._platform_mask
//
// MOVEMENT:
//-----------------------
//	Top-Down:
//		Keyboard:	WASD, Arrows
//		Gamepad:	D-PAD, L-Stick
//		Mouse:		Moves towards mouse when LMB is down
//		Touch:		Moves towards finger while touching
//	
//	Left-Right:
//		Keyboard:	AD, Arrows
//		Gamepad:	D-Pad, L-Stick
//		Mouse:		Moves towards mouse when LMB is down
//		Touch:		Moves towards finger while touching
//
//	Platform:
//		Keyboard:	AD, Arrows LR	to move
//					Space, Arrow up	to jump
//		Gamepad:	D-Pad, L-Stick	to move
//					F1 / A / Cross	to jump
//		Mouse:		LMB				to move
//					RMB				to jump
//		Touch:		Tilt			to move
//					Touch			to jump
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SET SPRITE AND MOVEMENT TYPE (mandatory)
//-----------------------------------------------------------------------------

// Example of a top-down character:
//----------------------------------
/*
scr_setup_character_topdown(	spr_red_cap_right_idle,		// will be mirrored for left
								spr_red_cap_right_walk,
								spr_red_cap_up_idle,
								spr_red_cap_up_walk,
								spr_red_cap_down_idle,
								spr_red_cap_down_walk,
								spr_red_cap_topdown_mask,
								spr_red_cap_shadow,			// set to -1 for no shadow sprite
								2, 4, 1);
*/

// Example of a left-right character:
//----------------------------------
/*
scr_setup_character_leftright(	spr_spaceship_idle,
								spr_spaceship_right,
								spr_spaceship_idle,
								1, 4, 1);
*/

// Example of a platform character:
//----------------------------------

scr_setup_character_platform(	spr_red_cap_right_idle,
								spr_red_cap_right_walk,
								spr_red_cap_right_jump,
								spr_red_cap_platform_mask,
								1, 4, 1, 6, 0.3);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SHADER (optional):
//-----------------------------------------------------------------------------
//shader		= shd;
//u_			= shader_get_uniform(shader, "");
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SET CAMERA TARGET & SCALE (optional)
//-----------------------------------------------------------------------------
//scr_camera_set_target(id, 0.1);
//scr_camera_set_scale(3);
#endregion
//-----------------------------------------------------------------------------


