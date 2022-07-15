spd = 0;
facing = 1;
spdMax = 2.5;
accel = 0.7;
inventory = [];
enum PlayerStates
{
	idle,
	move,
	attack
}
state = PlayerStates.idle;
moving = false;
array_push(inventory, instance_create_layer(x, y, layer, objWeponClass, new Pistol()));
array_push(inventory, instance_create_layer(x, y, layer, objWeponClass, new Shotgun()));
array_push(inventory, instance_create_layer(x, y, layer, objWeponClass, new Thompson()));
array_push(inventory, instance_create_layer(x, y, layer, objWeponClass, new Rifle()));
weponIndex = 0;
wepon = inventory[weponIndex];
// Just activate current wepon
//var i = 0; repeat (array_length(inventory))
//{
instance_deactivate_object(objWeponClass);
	//i++;
//}
instance_activate_object(inventory[weponIndex]);

changeWepon = function()
{
	
	var _in = mouse_wheel();
	var _invlen = array_length(inventory);
	if (abs(_in))
	{
		weponIndex += _in;
		weponIndex = abs(weponIndex) mod _invlen;
		instance_deactivate_object(objWeponClass);
		wepon = inventory[weponIndex];
		instance_activate_object(wepon);
		wepon.x = bbox_left + sprite_width*0.5;
		wepon.y = y-sprite_height*0.5;

	}
}
