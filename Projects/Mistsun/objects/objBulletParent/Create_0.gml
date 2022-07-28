enum BulletStates
{
	active,
	touched
}
event_inherited();
#region INITIALIZE
//instance_index = instanceof(self);
spd				= 0;
spdMax			= 0;
spdIncrease		= 0;
knockbackPower	= 0;
knocbackTime	= 0;
var m = function()
{
	instance_destroy();
}
destroyTimer = time_source_create(time_source_game, 60*2, time_source_units_frames, m);
time_source_start(destroyTimer);

// Methods
effectsArray	= array_create(0);
addToEffectList = function(_effect)
{
	array_push(effectsArray, _effect);
}

// Part types
particles = {
	destroy: part_type_create(),
}

var _p = particles.destroy; {
part_type_shape(_p, pt_shape_pixel);
part_type_life(_p, 20, 40);
part_type_scale(_p, 2, 2);
part_type_alpha2(_p, 1, 0.2);
part_type_direction(_p, image_angle - 190, image_angle - 170, 0, 0);
part_type_speed(_p, 0.5, 2, -0.2, 0);
addToEffectList(particles.destroy);
}

createDestroyEffect = function(_x, _y, _num)
{
	var _p = particles.destroy;
	part_type_direction(_p, image_angle - 190, image_angle - 170, 0, 0);
	part_type_speed(_p, 1, 3, -0.1, 0);
	part_particles_create(global.PSEffects, _x, _y, particles.destroy, _num);
}

#endregion