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
	
	part_type_sprite(_p, sprPlayer1, false, false, false);
	part_type_life(_p, 15, 20);
	
	part_type_alpha3(_p, 0.7, 1, 0);
	global.ptGhostDash = _p;

	
	//set as death
	//part_type_death(global.ptGhostDash, 1, global.ptExhaust);
	
#endregion

global.psBackground = part_system_create_layer("Effects", true);
#region Bolis
	var _p = part_type_create();
	
	part_type_shape(_p, pt_shape_pixel);
	part_type_life(_p, 40, 50);
	part_type_scale(_p, 1.5, 1.5);
	
	part_type_alpha3(_p, 0.7, 1, 0);
	global.ptBolis = _p;
	
#endregion
#region Star
	var _p = part_type_create();
	
	part_type_shape(_p, pt_shape_pixel);
	part_type_life(_p, 240, 300);
	
	part_type_speed(_p, 0.2, 0.5, 0, 0);
	part_type_direction(_p, 200, 160, 0, 0); 
	//part_type_orientation(_p, 200, 160, 0, 0, false);
	var scl = choose(1, 1, 1, 2, 2, 3);
	part_type_scale(_p, scl, scl);
	part_type_alpha3(_p, 0.7, 1, 0.3);
	global.ptStar = _p;

	
#endregion
	
global.psPlanets	= part_system_create_layer("Planets", true);
#region Planets
	var _p = part_type_create();
	
	part_type_sprite(_p, sprPlanets, false, false, true);
	part_type_life(_p, 8000, 9000);
	
	part_type_speed(_p, 1, 0.2, 0, 0);
	part_type_direction(_p, 180, 180, 0, 0); 
	//part_type_orientation(_p, 200, 160, 0, 0, false);
	var scl = choose(1, 1, 1, 2, 2, 3);
	part_type_scale(_p, scl, scl);
	part_type_alpha3(_p, 0.9, 1, 0.3);
	global.ptPlanets = _p;
	
#endregion
