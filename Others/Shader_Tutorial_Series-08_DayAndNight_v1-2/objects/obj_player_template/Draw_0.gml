/// @description Player (& Shadow)

if (shadow_sprite != -1)
	draw_sprite_ext(shadow_sprite, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
