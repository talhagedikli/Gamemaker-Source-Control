var gw = GUI_W, gh = GUI_H;
var length	= array_length(menu[menuLevel]);
var midX	= gw / 2;
var midy	= gh / 4;

var i = 0; repeat (length) 
{
	
	var c = pos == i ? C_CRIMSON : c_white;
	var a = (pos == i ? 1 - dsin(alphaTimer.time) : 1) + 0.2;
	var t = menu[menuLevel][i];
	
	draw_set_aling(fa_center, fa_center);
	draw_set_blend(c, a);
	draw_text(midX, midy + i * (string_height("Test") * 3 + 1), t);
	draw_set_blend(c_white, 1);

	i++;	
}