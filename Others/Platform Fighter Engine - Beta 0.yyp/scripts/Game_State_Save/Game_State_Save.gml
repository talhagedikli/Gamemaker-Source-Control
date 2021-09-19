///@func Game_State_Save
///@desc Saves the game state into a buffer.
function Game_State_Save() {

	var _b = buffer_create(1, buffer_grow, 1);

	//Save variables for obj_game

	//Save variables for obj_player

	//Save variables for obj_entity

	//Save variables for obj_fx

	//Save variables for obj_block_moving

	//Save variables for obj_hitbox

	//Save variables for obj_hurtbox

	//Save variables for obj_stage_manager

	//Trim off extra bytes and return
	buffer_resize(_b, buffer_tell(_b));
	return _b;


}
