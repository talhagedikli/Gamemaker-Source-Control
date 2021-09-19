///@func Match_Settings_String([default])
///@param [default]
///@desc Returns a string of the match settings.
var _default = argument_count > 0 ? argument[0] : "---";
var _text = "";
var _starting = true;

if (is_stock_match())
	{
	_text += string(global.match_stock) + " Stock";
	_starting = false;
	}
if (is_time_match())
	{
	if (!_starting) then _text += " | ";
	_text += string(global.match_time) + " Time";
	_starting = false;
	}
if (is_stamina_match())
	{
	if (!_starting) then _text += " | ";
	_text += string(global.match_stamina) + " Stamina";
	_starting = false;
	}
//Blank settings
if (_starting)
	{
	_text = _default;
	}
return _text;