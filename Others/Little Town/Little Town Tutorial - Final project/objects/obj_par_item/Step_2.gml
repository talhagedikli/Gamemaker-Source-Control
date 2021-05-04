/// @description Depth, more

/*
NOTE! 
We changed this Event to a End Step Event as per the 
instructions in Session 4 - 7.10: Returning Results from Functions
*/


// Depth, animation
switch myState {
	// If item is sitting on the ground
	case itemState.idle: {
		depth =-y;
		}; break;
	// If item has been taken
	case itemState.taken: {
		// Keep track of player position
		var _result = scr_itemPosition();
		x = _result[0];
		depth = _result[2];
		if (instance_exists(obj_player)) {
			// Animate item being picked up
			if (obj_player.myState == playerState.pickingUp) {
				// Wait until third frame of animation
				if (obj_player.image_index >= 2) {
					if (y > _result[1]) {
						y -= pickUpSp;
						}
					}
				}
			// Position item while being carried
			else {
				y = _result[1];
				}
			}
		}; break;
		// If item is being put back
	case itemState.puttingBack: {
		// Animate item being put down
		if (instance_exists(obj_player) && obj_player.myState == playerState.puttingDown) {
			if (y < putDownY) {
				y += putDownSp;
				}
			// Reset item state after being put down
			if (y >= putDownY) {
				myState = itemState.idle;
				}
			}
		}; break;
	}