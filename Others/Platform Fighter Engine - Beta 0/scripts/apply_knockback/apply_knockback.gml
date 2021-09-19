///@func apply_knockback(angle,speed,hitlag)
///@param angle
///@param speed
///@param hitlag
//These variables are just temporary holders.
//After hitlag, hsp and vsp are replaced with these.
kdir = argument[0];
kspd = argument[1];
//No speed during hitlag
set_speed(0, 0, false, false);
//Set state and the hitlag timer
set_state(PLAYER_STATE.in_hitlag);
state_frame = argument[2];