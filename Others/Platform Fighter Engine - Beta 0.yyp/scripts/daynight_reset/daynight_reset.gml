///@func daynight_reset()
///@desc Turns off the day night shader
function daynight_reset() {
	if (global.daynight_cycle_enable)
		{
		shader_reset();
		}


}
