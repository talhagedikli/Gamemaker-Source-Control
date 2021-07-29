function xState(name) constructor
{
	states	= {name: {}};
	changed = true;
	state	= states[$ name];
	static add	= function(name, struct)
	{
		states[$ name] = struct;
		states[$ "name"] = name;
		return self;
	}
	static change = function(name, funcbef = function() {}, funcaft = function() {})
	{
		funcbef();
		if (state[$ "leave"] != undefined) 
		{
			with other
			{
				script_execute_ext(method_get_index(other.state.leave), []);
			}
		}
		state = states[$ name];
		funcaft();
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
	static get_state = function()
	{
		return state[$ "name"];
	}
}