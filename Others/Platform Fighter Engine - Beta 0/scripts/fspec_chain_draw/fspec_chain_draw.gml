//Forward Special
if (attack_phase == 1)
	{
	var _col = palette_get_color(palette, 1);
	var _px = x;
	var _py = y;
	for(var i = 0; i < array_length_1d(fspec_chain_segments); i++)
		{
		var _seg = fspec_chain_segments[i];
		var _x = _seg[0];
		var _y = _seg[1];
		draw_line_width_color(_px, _py, _x, _y, 2, _col, _col);
		_px = _x;
		_py = _y;
		}
	}