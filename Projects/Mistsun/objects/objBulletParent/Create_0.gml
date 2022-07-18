event_inherited();
enum BulletStates
{
	active,
	touched
}
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
#endregion