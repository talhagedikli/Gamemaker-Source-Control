
//var gc = GUI.GetCenter();
//draw_set_font(fntText);
//draw_set_aling(fa_center, fa_center);
//draw_set_color(c_red);
//draw_text_transformed(gc.x, gc.y, "I am a text", 2, 2, 0);
//draw_set_color(c_white);
//draw_set_blend();
//draw_set_aling();

var vs = WINDOW.GetSize();
var gs = GUI.GetSize();
GUI.SetSize(gs.x * 2, gs.y * 2);
var gc = GUI.GetCenter();
draw_set_font(fntText);
draw_set_aling(fa_center, fa_center);
draw_set_color(c_red);
draw_text_transformed(gc.x, gc.y, "I am a text", 2, 2, 0);
draw_set_color(c_white);
draw_set_blend();
draw_set_aling();
GUI.SetSize();