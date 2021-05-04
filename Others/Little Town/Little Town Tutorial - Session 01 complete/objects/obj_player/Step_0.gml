/// @description Player movement, more

// Check keys for movement
moveRight = keyboard_check(vk_right);
moveUp = keyboard_check(vk_up);
moveLeft = keyboard_check(vk_left);
moveDown = keyboard_check(vk_down);

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

// If Idle
if (vx == 0 && vy == 0) {
	// Change idle Sprite based on last direction
	switch dir {
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
		}	
	}

// If moving
if (vx != 0 || vy != 0) {
	x += vx;
	y += vy;
	
	// Change walking Sprite based on direction
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
		}
	if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
		}	
	if (vy > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
		}
	if (vy < 0) {
		sprite_index = spr_player_walk_up;
		dir = 1;
		}	
	}

// Depth sorting
depth =-y;