var gw = GUI_W, gh = GUI_H;
if (room == rTitle)
{
	var i = 0; repeat(array_length(infoText))
	{
		//info = scribble(infoText[i])
		//.starting_format("fntText", c_white)
		//.transform(1, 1, 0)
		//.typewriter_in(0.5, 0, 60)
		//.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text(0, gh - i * string_height("TEST"), infoText[i]);
		//.align(fa_left, fa_bottom);
		//var siz = info.get_bbox();
		//info.draw(0, gh - i * siz.height);
		i++;
	}
}