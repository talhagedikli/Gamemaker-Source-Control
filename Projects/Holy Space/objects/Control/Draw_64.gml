/// @description Insert description here
// You can write your code in this editor
//var gw = GUI_W, gh = GUI_H;
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_font(fntText);
//var strTime = string(current_hour) + " : " + string(current_minute);
//var len = string_length("00 : 00");
//draw_text(gw - len * 8, 0, strTime);
var gw = GUI_W, gh = GUI_H;
if (state == "end")
{
	//Get the text element for our current line of text
	//Note that we're setting "textbox_element" here
	element = scribble("PRESS R TO RESTART")
	.starting_format("fntText", c_white)
	.transform(3, 3, 0)
	.typewriter_in(0.5, 0, 60)
	.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
	.align(fa_center, fa_center);

	//Draw main text body
	element.draw(gw/2, gh/2);	
}