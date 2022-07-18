#region INIT
owner			= noone;
bbox_width		= sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
bbox_height 	= sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

state			= 0;
facing			= 1;

effectsArray	= [];


// Methods
addToEffectList = function(_effect)
{
	array_push(effectsArray, _effect);
}
destroyAllParttypes = function()
{
	var i = 0; repeat(array_length(effectsArray))
	{
		var _effect = effectsArray[i];
		part_type_destroy(_effect);
		i++;
	}
}
stateChange = function(_state)
{
	self.state = _state;
}
getState = function()
{
	return self.state;
}
drawSelf = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
#endregion	