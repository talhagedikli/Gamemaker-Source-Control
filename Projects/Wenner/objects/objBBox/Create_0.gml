owner			= noone;
life			= undefined;
active			= true;
color			= c_white;
collisionList	= ds_list_create();
image_alpha		= 0.3;
Set	= function(x1, y1, w, h)
{
	x = x1;
	y = y1;
	image_xscale = w;
	image_yscale = h;
}

Active	= function(_life, _active)
{
	active			= _active;
	life			= _life;
}

GetCollider 	= function(colstr)
{
	if (active)
	{
		var b = instance_place(x, y, colstr.obj.object_index);
		if (b.owner != owner) return b;
		
	}
	return noone;
}

GetCollisionList = function(_colobj)
{
	var l = ds_list_create();
	var n = instance_place_list(x, y, objNPC, l, false);
	var i = 0; repeat(n)
	{
		var cid = l[| i];
		if (ds_list_safe(collisionList, cid))
		{
			ds_list_add(collisionList, cid);
		}
	}
	log(ds_list_size(l));
	ds_list_destroy(l);
}

WithColliders = function(_colobj, func)
{
	var i = 0; repeat(ds_list_size(collisionList))
	{
		var cid = collisionList[| i];
		if (ds_list_safe(hitList, cid))
		{
			ds_list_add(hitList, cid);
			with (cid)
			{
				func();
			}
		}
	}
	log(ds_list_size(l));
	ds_list_destroy(l);
}

WithCollider = function(_colobj, func)
{
	var cid = instance_place(x, y, _colobj);
	if (instance_exists(cid))
	{
		with (cid)
		{
			func();
		}
	}
}