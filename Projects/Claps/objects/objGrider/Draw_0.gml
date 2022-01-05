draw_self();
if (state.get_current_state() == "look")
{
	draw_rectangle((gp.x * GRID_WIDTH + GRID_WIDTH * 0.5) + (sign(look.x) * GRID_WIDTH * 0.5), 
					(gp.y * GRID_HEIGHT + GRID_HEIGHT * 0.5) + (sign(look.y) * GRID_HEIGHT * 0.5),
					(gp.x * GRID_WIDTH + GRID_WIDTH * 0.5) + (sign(look.x) * GRID_WIDTH * 0.5),
					(gp.y * GRID_HEIGHT + GRID_HEIGHT * 0.5) + (sign(look.y) * GRID_HEIGHT * 0.5),
					false);
}



