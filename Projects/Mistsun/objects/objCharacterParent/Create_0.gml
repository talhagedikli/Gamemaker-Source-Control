// Feather disable GM1061
bbox_width		= sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
bbox_height 	= sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

state			= 0;
facing			= 1;

effectsArray	= array_create(0);

weponInventory	= array_create(0);
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
addWepon = function(_wepon)
{
	array_push(weponInventory, _wepon);	
}
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

checkCollisions = function(_objectIndex, _xspd, _yspd)
{
	var sprite_bbox_top = bbox_top - self.y;
	var sprite_bbox_bottom = bbox_bottom - self.y;
	var sprite_bbox_right = bbox_right - self.x;
	var sprite_bbox_left = bbox_left - self.x;

	self.x += _xspd;
	if place_meeting(x, y, objSolidParent) {
		var wall = instance_place(self.x + sign(_xspd), self.y, objSolidParent);
		if (_xspd > 0)
		{ //right
			self.x = (wall.bbox_left - 1) - sprite_bbox_right;
		} 
		else if (_xspd < 0)
		{ //left
			self.x = (wall.bbox_right + 1) - sprite_bbox_left;
		}
		_xspd = 0;
	}
		
	//Applying vertical speed if there is no collision with block
		
	//Vertical collisions
	self.y += _yspd;
	if place_meeting(self.x, self.y, objSolidParent) {
		var wall = instance_place(self.x, self.y + sign(_yspd), objSolidParent);
		if (_yspd > 0)
		{ //down
			self.y = (wall.bbox_top - 1) - sprite_bbox_bottom;
		}
		else if (_yspd < 0)
		{ //up
			self.y = (wall.bbox_bottom + 1) - sprite_bbox_top;
		}
		_yspd = 0;
	}
}