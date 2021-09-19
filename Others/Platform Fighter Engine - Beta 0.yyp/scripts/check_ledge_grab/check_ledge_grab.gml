///@func check_ledge_grab()
///@desc Allows the player to grab a nearby ledge (read conditions listed below)
function check_ledge_grab() {
	if (instance_number(obj_ledge) > 0)
		{
		if (ledge_grab_timeout == 0)
			{
			var _nearest = instance_nearest(x,y,obj_ledge);
	
			/*
			Ledge grab conditions:
				The player cannot be on the opposite side of the ledge
				The bottom of the player must be below the ledge
				The player must be close enough to the ledge
				The player cannot be holding down on the control stick
				The player cannot be holding away from the ledge
			*/
	
			if (sign(_nearest.x-x) != -_nearest.ledge_direction && 
				bbox_bottom > _nearest.y &&
				distance_to_point(_nearest.x,_nearest.y) < ledge_grab_distance &&
				not stick_tilted(Lstick,DIR.down) &&
				(abs(stick_get_value(Lstick,DIR.horizontal)) < stick_tilt_amount ||
				sign(stick_get_value(Lstick,DIR.horizontal)) != -_nearest.ledge_direction))
				{
				set_state(PLAYER_STATE.ledge_snap);
				ledge_id = _nearest;
				state_frame=ledge_snap_time;
				facing = _nearest.ledge_direction;
				return true;
				}
			}
		}
	return false;


}
