///@func hitboxes_destroy_attached_all([hitbox_list])
///@param [hitbox_list]
//Destroys all of the attached hitboxes
var _list = argument_count > 0 ? argument[0] : my_hitboxes;
while(!ds_list_empty(_list))
	{
	//Instances remove themselves automatically
	with(_list[| 0])
		{
		instance_destroy();
		}
	}
	
/*
with(obj_attached_hitbox)
	{
	if (owner==argument0)
		{
		instance_destroy();
		}
	}
//*/