/// @description Show fps mean & bar

draw_set_color(global.text_color_ui_1);

draw_sprite_ext(spr_1x1px_white, 0, x1 + 2, y + bar_y_offset + 2, fps_counter / fps_count_to * (sprite_width - 4), bar_height, 0, global.text_color_ui_1, 1);

draw_set_halign(fa_right);
draw_text(x2, y - txt_y_offset, fps_text);
draw_set_halign(fa_left);

draw_set_color(c_white);
