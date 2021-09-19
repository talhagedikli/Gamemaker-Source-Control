///The HUD script for adding a limit gauge
///@args x,y,player,alpha
var _x = argument[0];
var _y = argument[1];
var _player = argument[2];
var _alpha = argument[3];
if (variable_instance_exists(_player, "limit_gauge") && variable_instance_exists(_player, "limit_gauge_max"))
	{
	draw_set_alpha(_alpha);
	draw_set_color(c_dkgray);
	draw_rectangle(_x - 60, _y - 60, _x + 30, _y - 52, false);
	if (_player.limit_gauge > 0)
		{
		draw_set_color(_player.limit_gauge == _player.limit_gauge_max ? $FFFF00 : $8934eb);
		draw_rectangle(_x - 60, _y - 60, _x - 60 + (90 * (_player.limit_gauge / _player.limit_gauge_max)), _y - 52, false);
		}
	draw_set_alpha(1);
	}
return;