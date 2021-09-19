/// @description 
/// @description
global.psEffects = part_system_create_layer("Effects", true);

#region Exhaust
	var _p = part_type_create();
	
	part_type_shape(_p, pt_shape_pixel);
	part_type_life(_p, 40, 50);
	part_type_scale(_p, 1.5, 1.5);
	
	part_type_alpha3(_p, 0.7, 1, 0);
	global.ptExhaust = _p;
	#endregion
	
#region Ghost Dash
	var _p = part_type_create();
	
	part_type_sprite(_p, sprite_index, false, false, false);
	part_type_life(_p, 15, 20);
	
	part_type_alpha3(_p, 0.7, 1, 0);
	global.ptGhostDash = _p;
	//set as death
	//part_type_death(global.ptGhostDash, 1, global.ptExhaust);
	
#endregion
