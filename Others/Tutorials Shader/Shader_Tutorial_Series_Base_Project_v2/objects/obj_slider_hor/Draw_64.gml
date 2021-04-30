/// @description slider

//draw_self(); // for debugging only

scr_draw_3slice_slider_hor(bar_sprite, x1_bar, y1_bar, x2_bar, bar_slice_size);

draw_sprite(btn_sprite, -1, x1_bar + btn_x_padding + value * slider_width, y);

var button_text	= caption;
if ((caption != "") && (show_value)) button_text += ": ";
if (show_value) button_text += string_format(value, 0, 2);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x1_bar + btn_x_padding + value * slider_width, y, button_text);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

