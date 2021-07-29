var gw = GUI_W, gh = GUI_H;
var length	= array_length(menu[menuLevel]);
var midX	= gw / 2;
var midy	= gh / 4;

var i = 0; repeat (length) 
{
	
	var c = pos == i ? C_CRIMSON : c_white;
	var a = (pos == i ? 1 - dsin(alphaTimer.time) : 1) + 0.2;
	var t = menu[menuLevel][i];
	
	element = scribble(t)
	.starting_format("fntText", c_white)
	.blend(c, a)
	.transform(2, 2, 0)
	.typewriter_in(0.5, 0, 60)
	.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
	.align(fa_center, fa_center);

	//Draw main text body
	element.draw(midX, midy + i*(string_height("TEST") * 3 + 1));
	
	
	i++;	
}