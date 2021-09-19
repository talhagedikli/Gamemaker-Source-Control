//Downward Throw for character0
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_dthrow0;
			anim_speed = 0;
			anim_frame = 0;
		
			attack_frame = 10;
			
			//No speed
			set_speed(0, 0, false, false);
			
			//Move the grabbed player below
			grabbed_id.grab_hold_x = 16;
			grabbed_id.grab_hold_y = 32;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 6)
				anim_frame = 1;
			if (attack_frame == 3)
				anim_frame = 2;
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 3;
			
				attack_phase++;
				attack_frame = 15;
				var _hitbox = create_targetbox(10, 16, 0.4, 0.4, 1, 5, 0, 3, 270, 1, HITBOX_SHAPE.circle, 0, grabbed_id);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.knockback_state, PLAYER_STATE.is_grabbed);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Multihits
			if (attack_frame % 2 == 0 && attack_frame != 0)
				{
				//Animation
				anim_frame++;
				
				hitbox_group_reset_all();
				var _hitbox = create_targetbox(10, 16, 0.4, 0.4, 1, 5, 0, 5, 270 + (attack_frame * 100), 1, HITBOX_SHAPE.circle, 0, grabbed_id);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.knockback_state, PLAYER_STATE.is_grabbed);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hitlag_scaling, 0);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.techable, false);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.asdi_multiplier, 0);
				}
			//Final Blow
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 10;
				
				attack_phase++;
				attack_frame = 15;
				var _hitbox = create_melee(10, 16, 0.4, 0.4, 5, 14, 0.3, 10, 75, 1, HITBOX_SHAPE.circle, 1);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hitstun_scaling, 1.5);
				}
			break;
			}
		//Endlag -> Finish
		case 2:
			{
			//Animation
			if (attack_frame == 12)
				anim_frame = 11;
			if (attack_frame == 8)
				anim_frame = 12;
			if (attack_frame == 4)
				anim_frame = 13;
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			}
		}
	}
//No movement