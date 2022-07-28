event_inherited();
enum WeponStates 
{
	idle,
	reload,
	attack
}
#region INIT
owner			= objPlayer.id;
bbox_width		= sprite_get_bbox_left(sprite_index) - sprite_get_bbox_right(sprite_index);
bbox_height 	= sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

state			= WeponStates.idle;
facing			= 1;

effectsArray	= array_create(0);

drawAngle		= image_angle;
attackAngle		= image_angle;

soundFX 		= {
	
};

// Methods
addToEffectList = function(_effect)
{
	array_push(effectsArray, _effect);
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