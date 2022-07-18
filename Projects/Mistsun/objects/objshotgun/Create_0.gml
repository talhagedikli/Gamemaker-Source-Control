event_inherited();

#region INIT
// Variables
sprite_index = sprShotgun;

numofBullets = 3;
bulletSpread = 7;

recoilPower = 7;

attackSound = sndPistolShot;

heatTime = 45;
var _f = function() {};
heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, _f);

part_type_shape(ptAttack, pt_shape_pixel);
part_type_life(ptAttack, 10, 50);
part_type_size(ptAttack, 3, 5, -0.1, 0);
part_type_color2(ptAttack, c_gray, c_dkgray);
part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);

// Methods
shoot = function()
{
	repeat (numofBullets)
	{
		var _x			= x + lengthdir_x(sprite_width, image_angle);
		var _y			= y + lengthdir_y(sprite_width, image_angle);
		var _b			= instance_create_layer(_x, _y, "Bullets", objSmallBullet);
		_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
		_b.direction	= _b.image_angle;
	}
}
#endregion

#region STATES

#endregion