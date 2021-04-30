/// @description Draw room name

draw_set_color(global.text_color_ui_1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font);

draw_text(x, y, text);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_standard);
