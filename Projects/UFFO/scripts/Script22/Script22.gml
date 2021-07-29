function state_change(_state, func = function() {})
{
	func();
	state = _state;
	changed = true;
}

function state_init(func = function() {})
{
	if (changed)
	{
		func();
		changed = false;
	}
}

function draw_set_aling(halign, valign)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

function draw_set_blend(color, alpha)
{
	draw_set_color(color);
	draw_set_alpha(alpha);
}








