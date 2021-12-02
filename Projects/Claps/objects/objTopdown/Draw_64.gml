
//var gc = gui.GetCenter();
//draw_set_font(fntText);
//draw_set_aling(fa_center, fa_center);
//draw_set_color(c_red);
//draw_text_transformed(gc.x, gc.y, "I am a text", 2, 2, 0);
//draw_set_color(c_white);
//draw_set_blend();
//draw_set_aling();

var gs = gui.GetSize();
gui.SetSize(gs.x * 2, gs.y * 2);
var gc = gui.GetCenter();
draw_set_font(fntText);
draw_set_aling(fa_center, fa_center);
draw_set_color(c_red);
draw_text_transformed(gc.x, gc.y, "I am a text", 2, 2, 0);
draw_set_color(c_white);
draw_set_blend();
draw_set_aling();
gui.SetSize();

