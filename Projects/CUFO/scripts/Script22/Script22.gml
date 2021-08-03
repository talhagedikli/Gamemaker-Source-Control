function state_change(_state, func = function() {})
{
	func();
	state = _state;
	changed = true;
}

function state_init(func = function() {})
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

function Typewriter(_text, _spd = 0.25) constructor
{
	text	= _text;
	char	= 1;
	charSpd = _spd;
	len		= string_length(text);
	done	= false;
	static write = function(_text = text)
	{
		len = string_length(_text);
		if (text != _text)
		{
			text = _text;
			len		= string_length(text);
		}
		if (char < len)
		{
			char += charSpd;
			done = false;
		}
		else
		{
			done = true;
		}
		return string_copy(text, 1, char);
	}
	static reset = function(_text = text)
	{
		done = false;
		text = _text;
		char = 1;
	}
	
}






