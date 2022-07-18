// Feather disable GM1061
bbox_width		= sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
bbox_height 	= sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

state			= 0;
facing			= 1;

effectsArray	= [];

weponInventory	= [];
state			= 0;

weponIndex	= 0;
wepon		= array_length(weponInventory) != 0 ? weponInventory[weponIndex] : noone;
// Just activate current wepon
//var i = 0; repeat (array_length(weponInventory))
//{
	//i++;
//}
//instance_activate_object(weponInventory[weponIndex]);

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
changeWepon = function()
{
	var _in = mouse_wheel();
	var _len = array_length(weponInventory);
	if (abs(_in))
	{
		weponIndex += _in;
		weponIndex = abs(weponIndex) mod _len;
		var i = 0; repeat (_len)
		{
			var _wepon = weponInventory[i];
			instance_deactivate_object(_wepon.id);
			i++;
		}
		wepon = weponInventory[weponIndex];
		instance_activate_object(wepon);
		wepon.x = bbox_left + sprite_width*0.5;
		wepon.y = y-sprite_height*0.5;
	}
}
