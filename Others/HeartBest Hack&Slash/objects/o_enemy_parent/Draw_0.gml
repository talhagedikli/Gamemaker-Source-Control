draw_self();

if state == "death" exit;

if alarm[0] > 0
{
	var height = sprite_height;
	draw_rectangle_color(x-12, y-height, x-12+(hp/max_hp)*24, y-(height-2), c_white, c_white, c_white, c_white, false);
	draw_sprite(s_enemy_healthbar, 0, x-12, y-height);
}
