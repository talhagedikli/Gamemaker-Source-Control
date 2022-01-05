draw_self();
if (state.get_current_state() == "look")
{
	var an = point_direction(0, 0, look.x, look.y);
	lookDir = lerp(lookDir, an, 1);
	var mx = (gp.x * GRID_WIDTH) + (GRID_WIDTH * 0.5),
		my = (gp.y * GRID_HEIGHT) + (GRID_HEIGHT * 0.5),
		tl = (gp.x * GRID_WIDTH), ty = (gp.y * GRID_HEIGHT),
		dr = 3,
		lx = wave(GRID_WIDTH * 0.4, GRID_WIDTH * 0.6, dr),
		ly = wave(GRID_HEIGHT * 0.4, GRID_HEIGHT * 0.6, dr),
		ldx = lengthdir_x(lx, lookDir),
		ldy = lengthdir_y(ly, lookDir);
		

	var cr = wave(0.2, 1, 2, 0);
	draw_set_blend(c_white, cr);
	draw_circle(mx + ldx, my + ldy, 2, false);
	draw_set_blend();
	
}



