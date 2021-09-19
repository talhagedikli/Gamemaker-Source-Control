///@func hit_fx_style_create(fx_style, angle, hitbox, knockback, [layer])
///@param fx_style
///@param angle
///@param hitbox
///@param knockback
///@param [layer]
var _style = argument[0],
	_angle = argument[1],
	_hitbox = argument[2],
	_knock = argument[3],
	_layer = argument_count > 4 ? argument[4] : "FX_Layer";
	
//If the user passes an array as the style, it runs each one in turn
var _styles = [];
if (is_array(_style))
	{
	_styles = _style;
	}
else
	{
	_styles = [_style];
	}

for(var i = 0; i < array_length_1d(_styles); i++)
	{
	switch(_styles[i])
		{
		#region Normal Weak
		case HIT_FX.normal_weak:
			//Direction Burst
			var _fx = create_fx(spr_hit_fx_direction_burst, 1, 0, 13, x, y, 1, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);

			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 10));
			
			//Powerful Knockback
			if (_knock > 16)
				{
				//Make more effects
				create_fx_action_lines(15, x, y, irandom(10), _layer);
				}

			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.3;
			break;
		#endregion
		#region Normal Medium
		case HIT_FX.normal_medium:
			//Direction Burst
			var _fx = create_fx(spr_hit_fx_direction_blast, 1, 0, 27, x, y, 1, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);
			var _fx2 = create_fx(spr_hit_fx_strong_hit, 1, 0, 10, x, y, 3, _angle, _layer);
			_fx2.fx_ys *= choose(-1, 1);
		
			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 10));
			
			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.4;
			break;
		#endregion
		#region Normal Strong
		case HIT_FX.normal_strong:
			//Direction Burst
			create_fx(spr_hit_fx_strong_initial_hit, 1, 0, 4, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1.5, irandom(360), _layer);
			var _fx1 = create_fx(spr_hit_fx_direction_burst, 1, 0, 13, x, y, 1, _angle, _layer);
			_fx1.fx_ys *= choose(-1, 1);
			var _fx2 = create_fx(spr_hit_fx_strong_hit, 1, 0, 10, x, y, 3, _angle, _layer);
			_fx2.fx_ys *= choose(-1, 1);
		
			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 10));
			
			//Powerful Knockback
			if (_knock > 15)
				{
				//Make more effects
				create_fx_action_lines(15, x, y, irandom(10), _layer);
				create_fx(spr_hit_fx_strong_lightning, 1, 0, 7, x, y, 2, _angle, _layer);
				create_fx(spr_hit_fx_circle, 1, 0, 17, x, y, 1, irandom(360), _layer);
				}
			
			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.5;
			break;
		#endregion
		#region Special
		case HIT_FX.special:
			//Direction Burst
			var _fx = create_fx(spr_hit_fx_direction_blast, 1, 0, 27, x, y, 1, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);

			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 10));
			
			//Powerful Knockback
			if (_knock > 16)
				{
				//Make more effects
				create_fx_action_lines(15, x, y, irandom(10), _layer);
				}

			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.5;
			break;
		#endregion
		#region Slash
		case HIT_FX.slash:
			//Direction Burst
			var _fx = create_fx(spr_hit_fx_direction_burst, 1, 0, 13, x, y, 1, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);
			var _fx = create_fx(spr_hit_fx_slash, 1, 0, 15, x, y, 1.5, _angle, _layer);

			//Particle Effects
			part_type_direction(global.p1, _angle - 5, _angle + 5, 0, 0);
			part_type_speed(global.p1, max(3, _knock), max(6, _knock + 2), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 5));
			
			//Powerful Knockback
			if (_knock > 16)
				{
				//Make more effects
				create_fx_action_lines(15, x, y, irandom(10), _layer);
				}

			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.5;
			break;
		#endregion
		#region Slash2
		case HIT_FX.slash2:
			//Direction Burst
			var _fx = create_fx(spr_hit_fx_slash2, 1, 0, 15, x, y, 1.5, _angle + 5, _layer);
			var _fx = create_fx(spr_hit_fx_slash2, 1, 0, 15, x, y, 1.5, _angle - 5, _layer);

			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(3, _knock), max(6, _knock + 2), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 5));
			
			//Powerful Knockback
			if (_knock > 16)
				{
				//Make more effects
				create_fx_action_lines(15, x, y, irandom(10), _layer);
				}

			//Camera shake
			camera_shake(_knock div 2);
		
			//Hit fade
			fade_value = 0.5;
			break;
		#endregion
		#region Grab
		case HIT_FX.grab:
			//With the target
			var _dir = irandom(360);
			var _fx = create_fx(spr_hit_fx_grab, 0, 0, 15, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 3, _dir, "FX_Layer_Below");
			_fx.shrink = 0.88;
			_fx.spin = 9;
			_fx.fade = true;
			var _fx = create_fx(spr_hit_fx_grab, 0, 0, 15, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 3, _dir + 180, "FX_Layer_Below");
			_fx.shrink = 0.88;
			_fx.spin = 9;
			_fx.fade = true;

			//Camera shake
			var _shake = (2 + ((damage / 20) * weight_multiplier) div 2);
			camera_shake(_shake);
			break;
		#endregion
		#region Explosion
		case HIT_FX.explosion:
			//Directional Burst
			var _fx = create_fx(spr_hit_fx_strong_hit, 1, 0, 10, x, y, 3, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);
		
			//Particle Effects
			part_type_direction(global.p1, 0, 360, 0, 0);
			part_type_speed(global.p1, 3, 6, 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, 15);
			create_fx(spr_hit_fx_strong_lightning, 1, 0, 7, x, y, 2, _angle, _layer);
			create_fx(spr_hit_fx_circle, 1, 0, 17, x, y, 1, irandom(360), _layer);

			//Camera shake
			camera_shake(clamp(_knock div 1.8, 1, 15));
			break;
		#endregion
		#region Splash
		case HIT_FX.splash:
			//Directional Burst
			var _fx1 = create_fx(spr_hit_fx_water, 1, 0, 24, x, y, 2, _angle, _layer);
			_fx1.fx_ys *= choose(-1, 1);
			var _fx2 = create_fx(spr_hit_fx_strong_hit, 1, 0, 10, x, y, 3, _angle, _layer);
			_fx2.fx_ys *= choose(-1, 1);
			
			//Particle Effects
			part_type_direction(global.p1, _angle - 15, _angle + 15, 0, 0);
			part_type_speed(global.p1, max(7, _knock), max(10, _knock + 3), 0, 0);
			part_particles_create(global.part_sys, x, y, global.p1, max(_knock / 5, 10));

			//Camera shake
			camera_shake(clamp(_knock div 1.8, 1, 15));
			break;
		#endregion
	
		#region Shield
		case HIT_FX.shield:
			//Hit effects
			create_fx(spr_hit_fx_shield, 1, 0, 11, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1, irandom(360));
			break;
		#endregion
		#region Shield Projectile
		case HIT_FX.shield_projectile:
			//Hit effects
			create_fx(spr_hit_fx_shield, 1, 0, 11, x, y, 1, irandom(360));
			break;
		#endregion
		
		#region Spin
		case HIT_FX.spin:
			//Spin effect
			var _fx = create_fx(spr_hit_fx_spin, 1, 0, 27, mean(_hitbox.owner.x, x), mean(_hitbox.owner.y, y), 1.5, _angle, _layer);
			_fx.fx_ys *= choose(-1, 1);
			break;
		#endregion
		#region Lines
		case HIT_FX.lines:
			//Action lines
			create_fx_action_lines(15, x, y, irandom(10), _layer);
			break;
		#endregion
		#region Emphasis
		case HIT_FX.emphasis:
			//Background clear
			background_clear_activate(20, palette_get_color(_hitbox.owner.palette, 0));
			//Hit fade
			fade_value = 0;
			break;
		#endregion
	
		#region None
		case HIT_FX.none:
		default: break;
		#endregion
		}
	}