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
	static write = function(_text = text)
	{
		if (text != _text)
		{
			text = _text;
			len		= string_length(text);
		}
		if (char < len)
		{
			char += charSpd;
		}
		return string_copy(text, 1, char);
	}
	static reset = function(_text = text)
	{
		text = _text;
		char = 1;
	}
	
}

function lengthdir(len = new Vector2(0), dir = new Vector2(0)) 
{
	return new Vector2(lengthdir_x(len.x, dir.x), lengthdir_y(len.y, dir.y));
}

function array_shuffled(arr)
{
	var len = array_length(arr);
	for (var i = 0; i < len; i++)
	{
		var r = irandom(len-1);
		
		var arr1 = arr[i];
		var arr2 = arr[r];
		
		arr[i] = arr2;
		arr[r] = arr1;
	}
	return arr;
}

function array_shuffle(arr)
{
	array_sort(arr, function() {
		return irandom_range(-1, 1);
	});
}

