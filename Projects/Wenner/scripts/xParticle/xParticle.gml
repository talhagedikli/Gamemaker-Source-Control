function xParticle(_system) constructor
{
	system	= _system;
	type	= part_type_create();
	time	= 0;
	
	static Shape = function(_shape)
	{
		part_type_shape(type, _shape);
	}
	
	static Sprite = function(_spr, _anim, _stretch, _random)
	{
		part_type_sprite(type, _spr, _anim, _stretch, _random);
	}
	
	static Size = function(sz_min, sz_max = sz_min, sz_increase, sz_wiggle)
	{
		part_type_size(type, sz_min, sz_max, sz_increase, sz_wiggle);
	}
	
	static Scale = function(_xscl, _yscl = _xscl)
	{
		part_type_scale(type, _xscl, _yscl);
	}
	
	static Speed = function(spd_min, spd_max, spd_inc, spd_wig)
	{
		part_type_speed(type, spd_min, spd_max, spd_inc, spd_wig);
	}
	
	static Direction = function(dir_min, dir_max, dir_incr, dir_wig)
	{
		part_type_direction(type, dir_min, dir_max, dir_incr, dir_wig);
	}
	
	static Gravity = function(grv_amount, grv_dir)
	{
		part_type_gravity(type, grv_amount, grv_dir);
	}
	
	static Orientation = function(ang_min, ang_max, ang_incr, ang_wig, ang_relative)
	{
		part_type_orientation(type, ang_min, ang_max, ang_incr, ang_wig, ang_relative);
	}
	
	static ColourMix = function(col1, col2)
	{
		part_type_color_mix(type, col1, col2);
	}
	
	static ColourRGB = function(rmin, rmax, gmin, gmax, bmin, bmax)
	{
		part_type_color_rgb(type, rmin, rmax, gmin, gmax, bmin, bmax);
	}
	
	static ColourHSV = function(hmin, hmax, smin, smax, vmin, vmax)
	{
		part_type_color_hsv(type, hmin, hmax, smin, smax, vmin, vmax);
	}
	
	static Colour = function(col1, col2 = col1, col3 = col1)
	{
		part_type_color3(type, col1, col2, col3);
	}
	
	static Alpha = function(a1, a2 = a1, a3 = a1)
	{
		part_type_alpha3(type, a1, a2, a3);
	}
	
	static Blend = function(additive)
	{
		part_type_blend(type, additive);
	}
	
	static Life = function(l_min, l_max = l_min)
	{
		part_type_life(type, l_min, l_max);
	}
	
	static Step = function(stp_num, stp_type)
	{
		part_type_step(type, stp_num, stp_type);
	}
	
	static Death = function(death_num, death_type)
	{
		part_type_death(type, death_num, death_type);
	}
	
	static Emit = function(_ind, _x, _y, _num, ticksize)
	{
		time += 1 / ticksize;
		if (time >= 1)
		{
			time = 0;
			part_particles_create(_ind, _x, _y, type, _num);
		}
	}
	
	static Clear = function()
	{
		part_type_clear(type);
	}
	
	static Destroy = function()
	{
		if (part_system_exists(system))
		{
			part_system_destroy(system);
		}
		if (part_type_exists(type))
		{
			part_type_destroy(type);
		}
	}
}