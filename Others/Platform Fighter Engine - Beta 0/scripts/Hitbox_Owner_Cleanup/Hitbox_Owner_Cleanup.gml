///@func Hitbox_Owner_Cleanup()
///@desc Cleans up datastructures related to owning hitboxes
ds_list_destroy(my_hitboxes);

//Destroy collided list
for(var i = 0; i < ds_list_size(collided); i++)
	{
	ds_list_destroy(collided[| i]);
	}
ds_list_destroy(collided);

my_hitboxes = -1;
collided = -1;