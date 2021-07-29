function state_change(_state, func)
{
	func();
	state = _state;
	changed = true;
}

function state_init(func)
{
	if (changed)
	{
		func();
		changed = false;
	}
}

function draw_set_aling(halign, valign)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

function draw_set_blend(color, alpha)
{
	draw_set_color(color);
	draw_set_alpha(alpha);
}

function xState() constructor
{
	state	= {};
	states	= {};
	changed = true;
	static add	= function(name, struct)
	{
		states[$ name] = struct;
		if (changed)
		{
			changed = false;
		}
		return self;
	}
	static change = function(name, func = function() {})
	{
		func();
		changed = true;
		if (state[$ "leave"] != undefined) 
		{
			with other
			{
				script_execute_ext(method_get_index(other.state.leave), []);
			}
		}
		state = states[$ name];
		if (state[$ "enter"] != undefined) 
		{
			with other
			{
				script_execute_ext(method_get_index(other.state.enter), []);
			}
		}
		return self;
	}
	static init = function(name)
	{
		changed = true;
		if (state[$ "leave"] != undefined) 
		{
			with other
			{
				script_execute_ext(method_get_index(other.state.leave), []);
			}
		}
		state = states[$ name];
		if (state[$ "enter"] != undefined) 
		{
			with other
			{
				script_execute_ext(method_get_index(other.state.enter), []);
			}
		}
		return self;
	}
	static call = function(name)
	{
		with other
		{
			script_execute_ext(method_get_index(other.state[$ name]), []);
		}
		return self;
	}
}






