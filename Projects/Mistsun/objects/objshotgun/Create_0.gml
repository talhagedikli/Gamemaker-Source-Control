event_inherited();

heatTime = 45;
numofBullets = 3;
time_source_reconfigure(heatTimer, heatTime, time_source_units_frames, function() {});
part_type_size(ptAttack, 3, 5, -0.1, 0);
part_type_color2(ptAttack, c_gray, c_dkgray);
part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);

facing = 1;

followOwner = function()
{
	var _gunFacingX = sign(mouse_x-owner.x);
	var _gunFacingY = sign(mouse_y-owner.y);

	var _margin = 8;
	var _x = owner.x - facing*(sprite_width*0.05) + owner.spd*real(INPUT.horizontalInput);
	var _y = owner.y - owner.sprite_height*0.25 + owner.spd*real(INPUT.verticalInput);
	x = lerp(x, _x, 0.5);
	y = lerp(y, _y, 0.5);

}

attackEffect = function()
{
	var _x = x + lengthdir_x(sprite_width*1, image_angle);	
	var _y = y + lengthdir_y(sprite_height*1, image_angle);
	var _m = 5;
	// part_type_direction(ptAttack, 80, 100, 0, 0);
	// part_type_speed(ptAttack, 0.5, 1.2, -0.01, 0);
	part_type_gravity(ptAttack, 0.05, random_range(image_angle-_m, image_angle+_m)+90*facing);
	part_particles_create(global.PSEffects, _x, _y, ptAttack, 1);
}

idle = function()
{
	var _pdir = point_direction(x, y, mouse_x, mouse_y);
	image_angle = _pdir;
	direction = _pdir;
	if (image_angle<90 || image_angle>270)
	{
		facing = 1;
	}
	else
	{
		facing = -1;
	}
	image_yscale = facing;
	
	followOwner();
	if (INPUT.keyShoot && time_source_get_state(heatTimer) == time_source_state_initial)
	{
		time_source_start(heatTimer);
		stateChange(WeponStates.attack);
	}
	else if (time_source_get_state(heatTimer) == time_source_state_stopped)
	{
		time_source_reset(heatTimer);	
	}
}

attack = function()
{

		var _back = 12;
		var _m = 10;
		var _spdm = 3;
		x += lengthdir_x(_back, image_angle-180);
		y += lengthdir_y(_back, image_angle-180);
		randomize();
		repeat (numofBullets)
		{
			var _b = instance_create_layer(x, y, layer, objBullet);
			var _x = x + lengthdir_x(sprite_width*1, image_angle);
			var _y = y + lengthdir_y(sprite_width*1, image_angle);
			_b.x = _x;
			_b.y = _y;
			_b.image_angle = random_range(image_angle-_m, image_angle+_m);
			_b.direction = random_range(image_angle-_m, image_angle+_m);
			_b.spd = random_range(_b.spd - _spdm, _b.spd + _spdm);
			attackEffect();
		}
		stateChange(WeponStates.idle);
}


