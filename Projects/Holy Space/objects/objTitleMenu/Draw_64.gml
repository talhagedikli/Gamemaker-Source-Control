var length	= array_length(menu[menuLevel]);
var midX	= 10;
var midy	= 10;

var i = 0; repeat (length) {
	//draw_set_valign(fa_left);
	//draw_set_halign(fa_left);
	//draw_set_font(fntMenu);
	
	var c = pos == i ? C_CRIMSON : c_white;
	var a = pos == i ? 1 - dsin(alphaTimer.time) : 1;
	var t = menu[menuLevel][i];
	
	//draw_text_color(midX, midy + i*(string_height("TEST") + 1), menu[menuLevel][i], c, c, c, c, a);
	//draw_set_valign(fa_top);
	//draw_set_halign(fa_left);
	//draw_set_alpha(1);
	//Note that we're setting "textbox_element" here
	
	element = scribble(t)
	.starting_format("fntText", c_white)
	.blend(c, a)
	.transform(2, 2, 0)
	.typewriter_in(0.5, 0, 60)
	.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
	.align(fa_left, fa_top);

	//Draw main text body
	element.draw(midX, midy + i*(string_height("TEST") * 3 + 1));
	
	
	i++;	
}