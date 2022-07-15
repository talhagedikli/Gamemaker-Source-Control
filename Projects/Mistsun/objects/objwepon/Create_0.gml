
ptAttack = part_type_create();
facing = 1;

owner = objPlayer;
state = WeponStates.idle;

stateChange = function(_state)
{
	self.state = _state;
}

getState = function()
{
	return self.state;
}

draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
idle = function() { };
followOwner = function() { };
attack = function() { };
follow = function() { };
attackEffect = function() { };