event_inherited();
spd = 0;
facing = 1;
spdMax = 2.5;
spdMin = 1.5;
accel = 0.7;
decel = 0.7;

state = PlayerStates.idle;
moving = false;
array_push(weponInventory, instance_create_layer(x, y, "Wepons", objPistol));
array_push(weponInventory, instance_create_layer(x, y, "Wepons", objShotgun));
array_push(weponInventory, instance_create_layer(x, y, "Wepons", objThompson));
array_push(weponInventory, instance_create_layer(x, y, "Wepons", objRifle));
array_push(weponInventory, instance_create_layer(x, y, "Wepons", objCrossbow));

// Init first wepon
weponIndex = 0;
wepon = weponInventory[weponIndex];
var i = 0; repeat(array_length(weponInventory))
{
	instance_deactivate_object(weponInventory[i].id);
	i++;
}
instance_activate_object(wepon.id);
