//Neutral Special - Draw
if (attack_phase == 1)
	{
	draw_set_color(c_white);
	var tx = 0, ty = 0;
	for(var i = 0; i < array_length_1d(program); i++)
		{
		tx += lengthdir_x(100, program[i]);
		ty += lengthdir_y(100, program[i]);
		draw_circle(x + tx, y + ty, 4, false);
		}
	}