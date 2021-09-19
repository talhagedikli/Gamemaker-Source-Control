/// @description
var _fx = create_fx(spr_projectile_trail, 1, 0, 28, x, y, 2, irandom(360), "FX_Layer_Below");
_fx.image_blend = palette_get_color(palette, 0);

//Turning
var _lx, _ly;
with(owner)
	{
	_lx = stick_get_value(Lstick, DIR.horizontal);
	_ly = stick_get_value(Lstick, DIR.vertical);
	}
if (point_distance(0, 0, _lx, _ly) > stick_tilt_amount)
	{
	var _newdir = point_direction(0, 0, _lx, _ly);
	var _turn_amount = clamp(angle_difference(_newdir, overlay_angle), -turn_speed, turn_speed);

	overlay_angle += _turn_amount;
	}
hsp = lengthdir_x(shoot_speed, overlay_angle);
vsp = lengthdir_y(shoot_speed, overlay_angle);

event_inherited();