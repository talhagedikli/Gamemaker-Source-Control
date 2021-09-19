///@func hurtbox_match_animation([hurtbox_sprite])
///@param [hurtbox_sprite]
///@desc Changes the hurtbox sprite to match the current animation. Useful for attacks.
var _sprite = argument_count > 0 ? argument[0] : anim_sprite;
if (sprite_exists(_sprite))
	{
	hurtbox.sprite_index = _sprite;
	hurtbox.image_index = anim_frame;
	hurtbox.image_xscale = sprite_scale * facing;
	hurtbox.image_yscale = sprite_scale;
	}