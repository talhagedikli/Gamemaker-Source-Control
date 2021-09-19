/*
function BBox() constructor
{
	owner					= other.id;
	obj 					= noone;
	collisionList			= ds_list_create();
	collisionSize			= 0;
	//color					= type == BOXTYPE.HITBOX ? C_CRIMSON : c_green;
	//if (type == BOXTYPE.HITBOX) color = c_red;
	//else if (type == BOXTYPE.HURTBOX) color = c_green

	active					= false;

	/// @func Set(_x = x, _y = y, _w = width, _h = height, _active = active, _life = undefined)
	static Set 				= function(_x = x, _y = y, _w = width, _h = height)
	{
		obj.x				= _x;
		obj.y				= _y;
		obj.image_xscale	= _w;
		obj.image_yscale	= _h;
	}
	static Active			= function(_active, _life)
	{
		obj.active			= _active;
		obj.life			= _life;
	}
	static GetObject		= function() 
	{
		return obj.id;
	}
	
	static GetBBox			= function() constructor
	{
		bboxLeft				= obj.bbox_left;
		bboxTop 				= obj.bbox_top;
		bboxRight				= obj.bbox_right;
		bboxBottom				= obj.bbox_bottom;			
	}
	
	static GetSize			= function() constructor
	{
		width					= obj.image_xscale;
		height					= obj.image_yscale;		
	}
	
	static WithColliders	= function(box, func)
	{
		var l, n;
		with (obj)
		{
			l = ds_list_create();
			n = instance_place_list(x, y, box.obj, l, false);
		}
		var i = 0; repeat(n)
		{
			with (l[| i])
			{
				func();
			}
			i++;
		}
		ds_list_destroy(l);
	}
	
	static destroy			= function()
	{
		ds_list_destroy(collisionList);
	}
}
*/

function Hitbox(_x, _y, _width, _height, _active = false, _life = undefined) constructor
{
	obj 					= instance_create_layer(_x, _y, "Game", objHitbox);
	obj.owner				= other.id;
	obj.image_xscale		= _width;
	obj.image_yscale		= _height;
	obj.visible 			= SHOW_COLLISIONS;
	obj.active				= _active;
	obj.life				= _life;

}
function Hurtbox(_x, _y, _width, _height, _active = true, _life = undefined) constructor
{
	obj 					= instance_create_layer(_x, _y, "Game", objHurtbox);
	obj.owner				= other.id;
	obj.image_xscale		= _width;
	obj.image_yscale		= _height;
	obj.visible 			= SHOW_COLLISIONS;
	obj.active				= _active;
	obj.life				= _life;

}


