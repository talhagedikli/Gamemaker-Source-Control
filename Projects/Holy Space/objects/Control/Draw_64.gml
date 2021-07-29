/// @description Insert description here
// You can write your code in this editor
var strTime = (current_hour < 10 ? "0" : "") + string(current_hour) + " : " + 
				(current_minute < 10 ? "0" : "") + string(current_minute);
var padd = 2;

// Draw clock
//display_set_gui_size(DIS_W, DIS_H);
var gw = GUI_W, gh = GUI_H;
var te = scribble(strTime)
.starting_format("fntText", c_white)
.transform(1, 1, 0)
.align(fa_right, fa_top);
var ts = te.get_bbox();
CleanRectangle(gw - ts.width - 3 * padd, 0 + padd, gw - padd, ts.height + padd)
.Blend(c_dkgray, 0.7)
.Border(2, c_dkgray, 0.9)
.Rounding(3)
.Draw();

te.draw(gw - 2 * padd, 0 + padd);
//display_set_gui_size(Camera.viewWidth, Camera.viewHeight);


if (state.get_current_state() == "end")
{
	var gw = GUI_W, gh = GUI_H;
	restartElement = scribble("PRESS R TO RESTART")
	.starting_format("fntText", c_white)
	.transform(3, 3, 0)
	.typewriter_in(0.5, 0, 60)
	.typewriter_ease(SCRIBBLE_EASE.ELASTIC, 0, -25, 1, 1, 0, 0.1)
	.align(fa_center, fa_center);

	//Draw main text body
	restartElement.draw(gw/2, gh/2);	
}