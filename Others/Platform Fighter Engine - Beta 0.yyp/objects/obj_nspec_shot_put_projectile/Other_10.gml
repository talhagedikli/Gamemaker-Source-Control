/// @description
//Reduced stun
base_hitlag = max(base_hitlag - 2, 0);
base_knockback = max(base_knockback - 0.1, 0);
var _fx = create_fx(spr_projectile_trail, 1, 0, 28, x, y, 2, irandom(360), "FX_Layer_Below");
_fx.image_blend = palette_get_color(palette, 0);
event_inherited();