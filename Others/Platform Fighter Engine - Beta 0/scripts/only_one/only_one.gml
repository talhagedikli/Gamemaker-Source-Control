///@func only_one()
//If there's more than one of the instance, destroy
if (instance_number(object_index) > 1)
	{
	instance_destroy();
	return true;
	}
return false;