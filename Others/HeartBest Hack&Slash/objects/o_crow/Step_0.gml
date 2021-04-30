switch (state) {
    #region chase
	case "chase":
		if not instance_exists(o_skeleton) break;
        if place_meeting(x, y, o_skeleton) and o_skeleton.state != "roll" and attacked = false {
			create_hitbox(x, y, self, sprite_index, _knockback, 1, _damage, image_xscale);
			attacked = true;
		}
		
		if (attacked = true) {
			vspeed = -1;
		}
		break;
		#endregion
		
	case "death":
		repeat (6) 
		{
		    instance_create_layer(x+random_range(-4,4), y-16+random_range(-4,4),"Instances",o_feather);
		}
		instance_destroy();
		break;
    default:
        // code here
        break;
}