 vsp = 0;
grv = 0.125;
walksp = 3;
hsp = walksp;

hp = 4;
flash = 0;
hitfrom = 0; //vurulma yönü
size = 1;
afraid_of_height = true;
grounded = false;
if (haswepon)
{
	mygun = instance_create_layer(x,y,"Gun",o_enemy_gun);
	with (mygun)
	{
		owner = other.id;
	}
}
else mygun = noone; 