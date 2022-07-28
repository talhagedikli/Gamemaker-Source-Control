checkOnlyOne = function()
{
	if (instance_number(self.object_index) > 1)
	{
		show("ERROR: MULTIPLE CONTROL OBJECT EXISTS");
		instance_destroy();
		exit;
	}	
}

checkOnlyOne();