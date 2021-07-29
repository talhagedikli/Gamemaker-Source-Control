var i = 0; repeat(array_length(text))
{
	element = scribble(text[i])
		.starting_format("fntText", c_white)
		.blend(c_white, alpha)
		.transform(2, 2, 0)
		.typewriter_in(0.5, 0, 60)
		.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
		.align(fa_left, fa_top);
	var es = element.get_bbox();
	
	element.draw(x, y + es.height * i);	
	i++;
}