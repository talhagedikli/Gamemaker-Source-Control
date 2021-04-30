/// @description Dimensions Info

if (!show_gui_overlay) exit;

var ww, hh, xx, yy, col, a, sep, offset;
ww		= display_get_gui_width();
hh		= display_get_gui_height();
offset	= 32;
sep		= 8;
col		= draw_get_color();
a		= draw_get_alpha();

// bars
draw_set_colour(c_blue);
draw_set_alpha(0.5);
draw_rectangle(0, 0, ww, offset, false); // top
draw_rectangle(0, hh - offset, ww, hh, false); // bottom
draw_rectangle(0, offset, offset, hh - offset, false); // left
draw_rectangle(ww - offset, offset, ww, hh -offset, false); // right

// boxes:
draw_set_colour(c_red);
draw_rectangle(offset, offset, ww * 0.5, hh * 0.5, false); // top-left
draw_set_colour(c_lime);
draw_rectangle(ww * 0.5, hh * 0.5, ww - offset, hh - offset, false); // bottom-right

// scale sprite
draw_sprite(spr_X_32, 0, ww * 0.5, hh * 0.5);


// Resolution Text:
var text1	= "View:\nApp:\nGUI:\nWin:\nDisp:";
var text2	= string(camera_get_view_width(view_camera[0]))		+ " x " + "\n"
			+ string(surface_get_width(application_surface))	+ " x " + "\n"
			+ string(display_get_gui_width())					+ " x " + "\n"
			+ string(window_get_width())						+ " x " + "\n"
			+ string(display_get_width())						+ " x ";
var text3	= string(camera_get_view_height(view_camera[0]))	+ "\n"
			+ string(surface_get_height(application_surface))	+ "\n"
			+ string(display_get_gui_height())					+ "\n"
			+ string(window_get_height())						+ "\n"
			+ string(display_get_height());

xx = offset;
yy	= offset;
ww = 4 * sep + string_width(text1) + string_width(text2) + string_width(text3);
hh = 2 * sep + string_height(text1);

draw_set_colour(c_black);
draw_rectangle(xx, yy, xx + ww, yy + hh, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_rectangle(xx, yy, xx + ww, yy + hh, true);

draw_text(xx + sep,													yy + sep, text1);
draw_text(xx + 2 * sep + string_width(text1),						yy + sep, text2);
draw_text(xx + 3 * sep + string_width(text1) + string_width(text2),	yy + sep, text3);


// reset vCol:
draw_set_colour(col);
draw_set_alpha(a);
