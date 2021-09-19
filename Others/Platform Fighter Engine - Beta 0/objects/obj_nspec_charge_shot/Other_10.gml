/// @description
var _fx = create_fx(spr_projectile_trail, 1, 0, 28, x, y, 3 * overlay_scale, irandom(360), "FX_Layer_Below");
_fx.image_blend = palette_get_color(palette, 0);
event_inherited();