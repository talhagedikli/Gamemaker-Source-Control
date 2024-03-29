function nair_palutena() {
	//Neutral Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(air_friction, grav, max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Canceling
	if run && cancel_ground_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_nair_palutena;
				anim_speed = 0;
				anim_frame = 0;
		
				landing_lag = 12;
				set_speed(0, -1, true, true);
				attack_frame = 5;
				nair_palutena_top_hitbox = noone;
				nair_palutena_bottom_hitbox = noone;
				return;
				}
			//Startup
			case 0:
				{
				if (attack_frame == 0)
					{
					anim_frame = 2;
					attack_phase++;
					attack_frame = 25;
					var _hitbox = create_melee(16, -32, 0.6, 0.6, 1, 6, 0, 1, 45, 26, HITBOX_SHAPE.circle, 0, FLIPPER.autolink_center);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hitlag_scaling = 0;
					_hitbox.techable = false;
					nair_palutena_top_hitbox = _hitbox;
					var _hitbox = create_melee(-16, 32, 0.6, 0.6, 1, 6, 0, 1, 45, 26, HITBOX_SHAPE.circle, 0, FLIPPER.autolink_center);
					_hitbox.hit_fx_style = HIT_FX.normal_weak;
					_hitbox.hitlag_scaling = 0;
					_hitbox.techable = false;
					nair_palutena_bottom_hitbox = _hitbox;
					}
				break;
				}
			//Active
			case 1:
				{
				if (attack_frame > 5)
					{
					anim_frame = 2 + (((25 - attack_frame) / 25) * 11);
					var _dir = ((anim_frame - 1) / 6) * 180;
					if (facing == -1) then _dir *= -1;
					var _len = 32;
					hitbox_move_attached(nair_palutena_top_hitbox, x + lengthdir_x(_len, _dir), y + lengthdir_y(_len, _dir), true);
					_dir += 180;
					hitbox_move_attached(nair_palutena_bottom_hitbox, x + lengthdir_x(_len, _dir), y + lengthdir_y(_len, _dir), true);
					if (attack_frame % 4 == 0)
						{
						hitbox_group_reset(0);
						}
					}
				else
					{
					hitbox_destroy(nair_palutena_top_hitbox, nair_palutena_bottom_hitbox);
					}
				if (attack_frame == 2)
					{
					anim_frame = 12;
					var _hitbox = create_melee(0, 0, 1.6, 1.6, 5, 6, 0.7, 10, 50, 3, HITBOX_SHAPE.circle, 1, FLIPPER.sakurai);
					_hitbox.hit_fx_style = HIT_FX.normal_medium;
					_hitbox.hit_sfx = snd_hit_strong2;
					}
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = attack_has_hit() ? 14 : 21;
					landing_lag = attack_has_hit() ? 4 : 10;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				if (attack_frame == 18)
					anim_frame = 13;
				if (attack_frame == 15)
					anim_frame = 14;
				if (attack_frame == 12)
					anim_frame = 15;
				if (attack_frame == 9)
					anim_frame = 16;
				if (attack_frame == 4)
					anim_frame = 17;
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();


}
