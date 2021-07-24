#region Create -----------------------------------------------------------------
// Init
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
animation_init();
//speed variables
xSpeed		= 0;
ySpeed		= 0;
gSpeed		= 0.06;
facing		= 1;
moveDir 	= new Vector2();
lastPos 	= new Vector2();
moveTween	= new TweenV2(tweenType.QUARTEASEIN);
moveTimer	= new Timer();
moveDurMax	= 12;
moveDurMin	= 3;
moveDur		= moveDurMax;

// Sound
walkSound	= aWalk;

// Inventory
hpMax		= 5;
hp			= hpMax;
inventory	= [];
showInv		= false;
invBgAlpha	= 0;
invSur		= -1;
tempSur		= -1;
invIndex	= 0;
wepons		= [];
focused		= 0;
focusDelay	= 20;
focusTimer	= new Timer();

// Attack 
attackDir	= new Vector2(0, 0);
attackTimer	= new Timer();
attackDur	= 8;
attackTween = new TweenV2(tweenType.BACKEASEOUT);
attackDelay	= new Timer();
colliding	= noone;

// Area and distance
enum DIR 
{
	RIGHT,
	UP,
	LEFT,
	DOWN
	
}
area = [
	[1],	// Right (y = 0)
	[1],	// Up (x = 0)
	[1],	// Left (y = 0)
	[1]	// Down (x = 0)
];
distance	= array_create(array_length(area));


//show(dirfind(area));
collisions	= ds_list_create();
touching	= false;

gridPos 	= new Vector2(x div GRID_W, y div GRID_H);
#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions
/// @func findDistance(pos, area))
findDistance	= function(_pos, _area)
{
	var _x, _y, index = 0, len = 1, value;
	var i = 0; repeat(array_length(_area))
	{
		var j = 0; repeat(array_length(_area[i]))
		{
			array_resize(distance, len);
			value	= _area[i][j];
			if (i == DIR.RIGHT)
			{
				_x	= value;
				_y	= 0;
			}
			else if (i == DIR.UP)
			{
				_x	= 0;
				_y	= -value;
			}
			else if (i == DIR.LEFT)
			{
				_x	= -value;
				_y	= 0;
			}
			else if (i == DIR.DOWN)
			{
				_x	= 0;
				_y	= value;
			}
	        if (!is_struct(distance[index]))
	        {
	            distance[index] = new Grid(_pos.x + _x, _pos.y + _y);
	        }
	        else
	        {
				distance[index].set(_pos.x + _x, _pos.y + _y);
			}			
			j++;
			len++;
			index++;
		}
		i++;
	}
}
findDistance(gridPos, area);

/// @func addArea(area, value))
addArea			= function(_area, _value)
{
	var i = 0; repeat(array_length(_value))
	{
		var j = 0; repeat(array_length(_value[i]))
		{
			if (array_safe(_area[i], _value[i][j]))
			{
				array_push(_area[i], _value[i][j]);
			}
			j++;
		}
		i++;
	}
}

snapPosition	= function()
{
	var _tlx	= x - sprite_xoffset,
	_tly		= y - sprite_yoffset,
	_xspc		= _tlx mod GRID_W,
	_yspc		= _tly mod GRID_H;
	if (_xspc != 0 || _yspc != 0)
	{
		x = _xspc < GRID_W / 2 ? x - _xspc : x + _xspc;
		y = _yspc < GRID_H / 2 ? y - _yspc : y + _yspc;
	}
}
// Collision functions
gridList		= function(_dist, _object, _pos = undefined, _arr = undefined)
{
	static gm		= 1;
	static bl		= noone;
	static _list	= ds_list_create();
	if (!ds_exists(_list, ds_type_list))
	{
		_list = ds_list_create();
		show("created list");
	}
	else
	{
		ds_list_clear(_list);
	}
	var i = 0; repeat(array_length(_dist))
	{
		var x1	= _dist[i].x,	x2		= _dist[i].x + 1,
		y1		= _dist[i].y,	y2		= _dist[i].y + 1,
		gr		= _dist[i],
		safe	= true;
		bl		= collision_line(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm, _object, false, true);
		var j = 0; repeat(ds_list_size(_list))
		{
			if (ds_list_find_value(_list, j) == bl)
			{
				safe = false;
			}
			j++;
		}
		if (safe)
		{
			collision_line_list(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm, _object, false, true, _list, false);
		}
		i++;
		
	}
	return _list;
}

gridMeeting 	= function(_x, _y, _obj)
{
	if (instance_exists(_obj))
	{	
		return position_meeting(_x * GRID_W, _y * GRID_H, _obj);
	}
	return false;
}

gridPlace		= function(_x, _y, _obj)
{
	if instance_exists(_obj)
	{
		return instance_position(_x * GRID_W, _y * GRID_H, _obj);
	}
	return noone;
}

distanceMeeting	= function(_dist = distance, _obj)
{
	var i = 0; repeat(array_length(_dist))
	{
		var bl = gridPlace(_dist[i].x, _dist[i].y, _obj);
		if(bl != noone)
		{
			return true;
		}
		i++;
	}
	return false;
}

distancePlace	= function(_dist = distance, _obj)
{
	var i = 0; repeat(array_length(_dist))
	{
		var bl = gridPlace(_dist[i].x, _dist[i].y, _obj);
		if(bl != noone)
		{
			return bl;
		}
		i++;
	}
	return noone;
}

tileCollision		= function(_gx, _gy, _tile)
{
	return tile_meeting(_gx * GRID_W, _gy * GRID_H, _tile);
}

dirfind 		= function(_area)
{
	var r = [], u = [], l = [], d = [];
	var resize = array_create(4, 0);
	var i = 0; repeat(array_length(_area))
	{
		var _x = _area[i][0];
		var _y = _area[i][1];
		if (_x >= 0 && _y == 0)
		{
			resize[0]++;
			array_resize(r, resize[0]);
			r[resize[0] - 1] = _x;
		}
		else if (_x = 0 && _y <= 0)
		{
			resize[1]++;
			array_resize(u, resize[1]);
			u[resize[1] - 1] = _y;
		}	
		else if (_x <= 0 && _y == 0)
		{
			resize[2]++;
			array_resize(l, resize[2]);
			l[resize[2] - 1] = _x;
		}
		else if (_x == 0 && _y >= 0)
		{
			resize[3]++;
			array_resize(d, resize[3]);
			d[resize[3] - 1] = _y;
		}
		i++;
	}
	return [r, u, l, d];
}

// Array sorting functions
typeSort	= function(_a, _b)
{
	return _a.type - _b.type;
}
#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
state = new SnowState("idle");

state.history_enable();
state.set_history_max_size(15);
state.event_set_default_function("init", function() 
{
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
});

state.add("idle", {
	enter: function() 
	{
		snapPosition();
		gridPos.set(x div GRID_W, y div GRID_H);
		findDistance(gridPos, area);
		collisions = gridList(distance, objBlock);
		audio_listener_set_position(0, x, y, 0);
		// test
	},
	step: function()
	{
		if  (abs(InputManager.horizontalInput) || abs(InputManager.verticalInput))
		{
			moveDur = approach(moveDur, moveDurMin, 2);
		}
		else 
		{
			moveDur = approach(moveDur, moveDurMax, 8);
		}
		if (gridMeeting(gridPos.x + InputManager.horizontalInput, gridPos.y, objCollidibleParent) || gridMeeting(gridPos.x, gridPos.y + InputManager.verticalInput, objCollidibleParent) ||
			tileCollision(gridPos.x + InputManager.horizontalInput, gridPos.y, "TileCollision") || tileCollision(gridPos.x, gridPos.y + InputManager.verticalInput, "TileCollision"))
		{
			moveDur = moveDurMax;
		}
		if (keyboard_check_pressed(ord("E")))
		{
			var bl = distancePlace(distance, objBlock);
			if instance_exists(bl) bl.fadeOut = true;
		}

		
		// Switch to move
		if (abs(InputManager.horizontalInput) && !tileCollision(gridPos.x + InputManager.horizontalInput, gridPos.y, "TileCollision"))
		{
			moveDir.set(InputManager.horizontalInput, 0);
			lastPos.x = x;
			lastPos.y = y;
			state.change("move")
		}
		else if (abs(InputManager.verticalInput) && !tileCollision(gridPos.x, gridPos.y + InputManager.verticalInput, "TileCollision"))
		{
			moveDir.set(0, InputManager.verticalInput);
			lastPos.x = x;
			lastPos.y = y;
			state.change("move")
		}
	}
});
	
state.add("move", {
	enter: function() 
	{
		moveTween.start(0, 1, moveDur);
		moveTimer.start(moveDur);
		attackDelay.start(moveDur*4/5);
		DoLater(moveDur*4/5, function(data)
		{
			var _item = gridPlace(gridPos.x + moveDir.x, gridPos.y + moveDir.y, objItemParent);
			if (instance_exists(_item)) 
			{
				_item.pick();
				attackDelay.stop();
				moveTween.stop();
				state.change("attack");
			}
			var _inst = gridPlace(gridPos.x + moveDir.x, gridPos.y + moveDir.y, objEnemyParent);
			if (instance_exists(_inst)) 
			{
				_inst.getDamage(1);
				attackDelay.stop();
				moveTween.stop();
				state.change("attack");
			}
		}, { nextState: "attack"}, true);
		
		//alarm[0] = moveDur*4/5;			// 10
	},
	step: function() 
	{
		x = flerp(x, lastPos.x + lengthdir_x(GRID_W, moveDir.angle(false)), moveTween.value);
		y = flerp(y, lastPos.y + lengthdir_y(GRID_H, moveDir.angle(false)), moveTween.value);

		if (moveTween.done)
		{
			moveTween.stop();
			state.change("idle");
		}
	},
	leave: function()
	{
		audio_play_sound(walkSound, 1, false);
	}
});

state.add("attack", {
	enter: function()
	{
		attackTween.start(0, 1, attackDur);
		attackTimer.start(attackDur);
		moveDur = moveDurMax;
		if (instance_exists(colliding)) colliding.fadeOut = true;
	},
	step: function()
	{
		x = flerp(x, gridPos.x * GRID_W, attackTween.value);
		y = flerp(y, gridPos.y * GRID_H, attackTween.value);
		if (attackTween.done)
		{
			attackTween.stop();
			state.change("idle");
		}
	}
});

#endregion //-------------------------------------------------------------------

Camera.following = self;

global.clock.variable_interpolate("x", "iotaX");
global.clock.variable_interpolate("y", "iotaY");

global.clock.add_cycle_method(function() {
	
});



