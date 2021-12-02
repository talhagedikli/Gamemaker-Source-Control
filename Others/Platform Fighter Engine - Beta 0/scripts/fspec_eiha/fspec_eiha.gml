//Forward Special
/*
- Creates a quick projectile that erupts on contact
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);

if (on_ground())
	{
	friction_gravity(ground_friction, grav, max_fall_speed);
	}
else
	{
	friction_gravity(air_friction, grav, max_fall_speed);
	aerial_drift();
	}

//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_fspec_eiha;
			anim_speed = 0;
			anim_frame = 0;
			
			attack_frame = 16;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 6)
				{
				b_reverse();
				anim_frame = 1;
				}
				
			if (attack_frame == 0)
				{
				anim_frame = 2;
			
				attack_phase++;
				attack_frame = 30;
				var _proj = create_projectile(16, -32, 0.2, 0.2, 8, 6, 0.7, 65, 26, HITBOX_SHAPE.circle, 11, 3);
				_proj.hit_fx_style = [HIT_FX.normal_medium, HIT_FX.slash];
				_proj.hit_sfx = snd_hit_weak2;
				_proj.destroy_on_blocks = true;
				hitbox_set_overlay_sprite(_proj, spr_fspec_eiha_projectile, 0, 0.5, 2, 0, c_white, 1, facing);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame == 20)
				anim_frame = 3;
			if (attack_frame == 12)
				anim_frame = 4;
				
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