/// @description
//Destory data structures to prevent memory leaks
ds_list_destroy(input_buffer);
ds_list_destroy(input_buffer_paused);
ds_list_destroy(my_hitboxes);
ds_list_destroy(state_log);
ds_list_destroy(my_states);
ds_map_destroy(my_attacks);
ds_map_destroy(my_sprites);
ds_map_destroy(attack_cooldown);

//Destroy collided list
for(var i = 0; i < ds_list_size(collided); i++)
	{
	ds_list_destroy(collided[| i]);
	}
ds_list_destroy(collided);

input_buffer = -1;
my_hitboxes = -1;
collided = -1;
state_log = -1;
my_attacks = -1;
my_sprites = -1;
custom_controls = 0;