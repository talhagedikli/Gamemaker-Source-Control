/// @description 
/// @description
global.psEffects = part_system_create_layer("Effects", true);

#region Exhaust
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_pixel);
	part_type_life(p, 20, 30);
	part_type_scale(p, 1.5, 1.5);
	
	part_type_alpha3(p, 0.7, 1, 0);
	global.ptExhaust = p;
	#endregion

#region ShineEffect
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_pixel);
	part_type_life(p, 30, 40);
	part_type_speed(p, 0.3, 0.5, 0, 0);
	part_type_direction(p, 85, 95, 0, 0);
	part_type_size(p, 0.5, 1.4, 0, 0);
	part_type_alpha3(p, 0.7, 1, 0);
	global.ptShine = p;
	#endregion

#region Bullet Destroy
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_pixel);
	part_type_life(p, 20, 30);
	part_type_color1(p, $0f0B9e);
	part_type_direction(p, 0, 360, 0, 0);
	part_type_speed(p, 0.3, 0.5, 0, 0);
	part_type_scale(p, 1.5, 1.5);
	
	part_type_alpha3(p, 0.7, 1, 0);
	global.ptBulletDestroy = p;
	#endregion
#region Bullet Shoot
	var p = part_type_create();
	
	part_type_sprite(p, sprAllyBullets, false, false, false);
	part_type_life(p, 70, 100);
	part_type_direction(p, 80, 110, 0, 0);
	part_type_speed(p, 2, 3, 0, 0);
	part_type_gravity(p, 0.1, 270);
	part_type_scale(p, 0.5, 0.5);
	
	part_type_alpha3(p, 0.8, 1, 0.2);
	global.ptShoot = p;
	#endregion
	
#region Ghost Dash
	var p = part_type_create();
	
	part_type_sprite(p, sprPlayer1, false, false, false);
	part_type_life(p, 15, 20);
	
	part_type_alpha3(p, 0.7, 1, 0);
	global.ptGhostDash = p;

	
	//set as death
	//part_type_death(global.ptGhostDash, 1, global.ptExhaust);
	
#endregion

#region Fog
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_cloud);
	part_type_life(p, 800, 1000);
	part_type_size(p, 0.7, 2, 0, 0);
	part_type_direction(p, 180, 180, 0, 0);
	part_type_speed(p, 0.2, 0.4, 0, 0);
	part_type_alpha3(p, 0.7, 1, 0.1);
	global.ptFog = p;

	
	//set as death
	//part_type_death(global.ptGhostDash, 1, global.ptExhaust);
	
#endregion

global.psBackground = part_system_create_layer("Effects", true);
#region Bolis
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_pixel);
	part_type_life(p, 40, 50);
	part_type_scale(p, 1.5, 1.5);
	
	part_type_alpha3(p, 0.7, 1, 0);
	global.ptBolis = p;
	
#endregion
#region Star
	var p = part_type_create();
	
	part_type_shape(p, pt_shape_pixel);
	part_type_life(p, 240, 300);
	
	part_type_speed(p, 0.5, 1, 0, 0);
	part_type_direction(p, 200, 160, 0, 0); 
	//part_type_orientation(p, 200, 160, 0, 0, false);
	var scl = choose(1, 1, 1, 2, 2);
	part_type_scale(p, scl, scl);
	part_type_alpha3(p, 0.7, 1, 0.3);
	global.ptStar = p;

	
#endregion
	
global.psPlanets	= part_system_create_layer("Planets", true);
#region Planets
	var p = part_type_create();
	
	part_type_sprite(p, sprPlanets, false, false, true);
	part_type_life(p, 8000, 9000);
	
	part_type_speed(p, 1, 0.2, 0, 0);
	part_type_direction(p, 180, 180, 0, 0); 
	//part_type_orientation(p, 200, 160, 0, 0, false);
	var scl = choose(1, 1, 1, 2, 2, 3);
	part_type_scale(p, scl, scl);
	part_type_alpha3(p, 0.9, 1, 0.3);
	global.ptPlanets = p;
	
#endregion
