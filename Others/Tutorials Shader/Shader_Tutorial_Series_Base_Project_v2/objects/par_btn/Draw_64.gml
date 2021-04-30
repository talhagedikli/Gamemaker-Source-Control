/// @description button
draw_sprite(sprite_index, image_index, x, y);

if (caption = "") exit;
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x, y, caption);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
