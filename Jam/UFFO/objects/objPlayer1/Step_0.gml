image_xscale = approach(image_xscale, 1, 0.03);
image_yscale = approach(image_yscale, 1, 0.03);
move_wrap(false, true, 1);
if (outside()) state.change("death");
// Set defaults
setDefaultVariables();

if (is_struct(bounity))
{
	with (self)
	{
		bounity.use();
	}
}
log(wepon.delay);
state.step();

// part_type_speed(global.ptFog, 0.2 * global.difficulty, 0.4 * global.difficulty, 0, 0);