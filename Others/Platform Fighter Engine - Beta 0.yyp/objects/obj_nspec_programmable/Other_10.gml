/// @description
var _fx = create_fx(spr_projectile_trail,1,0,28,x,y,2,irandom(360),"FX_Layer_Below");
_fx.image_blend = palette_get_color(palette, 0);
event_inherited();
//Follow instructions
if (current_inst <= array_length_1d(instructions) - 1)
	{
	hsp = lengthdir_x(10, instructions[current_inst]);
	vsp = lengthdir_y(10, instructions[current_inst]);
	overlay_angle = instructions[current_inst];
	}
if (++timer > 10)
	{
	timer = 0;
	current_inst++;
	if (current_inst > array_length_1d(instructions) - 1)
		{
		instance_destroy();
		exit;
		}
	}