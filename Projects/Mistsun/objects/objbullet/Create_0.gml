spd = 10;
spdIncrease = 1;
var m = function()
{
	instance_destroy(self.id);
}
destroyTimer = time_source_create(time_source_game, 60*2, time_source_units_frames, m);
time_source_start(destroyTimer);