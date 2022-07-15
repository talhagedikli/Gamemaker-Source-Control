event_inherited();
facing = 1;
heatTime = 10;
attackAngle = 60;
attacking = false;
position = 1;

angleTween = new Tween(TweenType.QuartEaseOut, 0, 0, heatTime, false);



heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
{
	time_source_reset(self.heatTimer);
});


// going to edit
// part_type_direction(effect, 0, 0, 0, 0);
// part_type_speed(effect, 0, 0, 0, 0);

// part_type_shape(ptAttack, pt_shape_pixel);
// part_type_life(ptAttack, 10, 50);
// part_type_alpha2(ptAttack, 1, 0.6);



// Core.pt.addPartType(ptAttack);
shootEffect = function(_num)
{
	var _x = x + lengthdir_x(sprite_width*1.5, image_angle);	
	var _y = y + lengthdir_y(sprite_height*1.5, image_angle);
	
	part_type_direction(ptAttack, 80, 100, 0, 0);
	part_type_speed(ptAttack, 0.5, 1.2, -0.01, 0);
	// part_particles_create(global.PSEffects, _x, _y, ptAttack, _num);
}

followOwner = function()
{
	var _marginx = lengthdir_x(owner.sprite_width*0.3, image_angle);
	var _marginy = lengthdir_y(owner.sprite_height*0.3, image_angle);
	var _x = owner.x + owner.spd*real(INPUT.horizontalInput) + _marginx;
	var _y = owner.y - owner.sprite_height*0.25 + _marginy;
	x = lerp(x, _x, 0.2);
	y = lerp(y, _y, 0.2);	
}

idle = function()
{
	var _horizontalInput	= INPUT.horizontalInput;// Will be -1, 0 or 1
	var _verticalInput		= INPUT.verticalInput;
	var _keyShoot			= INPUT.keyShoot;
	var _pdir = point_direction(x, y, mouse_x, mouse_y);
	

	// var _ta = _pdir + swingAngle*facin ?
	if (_pdir<90 || _pdir>270) 
	{
		position = 1;
	}
	else
	{
		position = -1;
	}
	
	image_angle = _pdir + position*facing*attackAngle;
	direction = image_angle;
	
	followOwner();
	
	if (INPUT.keyShoot)
	{
		facing *= -1;
		angleTween.start(image_angle, _pdir+position*facing*attackAngle);
		stateChange(WeponStates.attack);
	}
}

draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

attack = function()
{
	var _horizontalInput	= INPUT.horizontalInput;// Will be -1, 0 or 1
	var _verticalInput		= INPUT.verticalInput;
	var _keyShoot			= INPUT.keyShoot;
	var _pdir				= point_direction(x, y, mouse_x, mouse_y);
	
	image_angle = angleTween.getValue();
	direction = image_angle;
	
	followOwner();
	
	if (angleTween.isFinished())
	{
		angleTween.reset();
		stateChange(WeponStates.idle);
	}
}



