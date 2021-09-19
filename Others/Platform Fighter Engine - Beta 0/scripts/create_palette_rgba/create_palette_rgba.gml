///@func create_palette_rgba(color_rgba...)
///@param color_rgba...
///@desc Stores any number of colors in RGBA format. Max 10 colors
var _palette = []
var m = 0;
for(var i=0;i<argument_count;i++)
	{
	//R
	_palette[m  ] = (argument[i] >> 24 & $FF) / $FF;
	//G
	_palette[m+1] = (argument[i] >> 16 & $FF) / $FF;
	//B
	_palette[m+2] = (argument[i] >> 8 & $FF) / $FF;
	//A
	_palette[m+3] = (argument[i] & $FF) / $FF;
	
	m+=4;
	}
return _palette;