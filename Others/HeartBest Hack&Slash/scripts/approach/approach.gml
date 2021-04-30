///@param current_value
///@param target_value
///@param change_amount
function approach(_current_value, _target_value, _change_amount)
{
	if _current_value < _target_value {
		_current_value += _change_amount;
		_current_value = min(_current_value, _target_value);
	}
	else 
	{
		_current_value -= _change_amount;
		_current_value = max(_current_value, _target_value);
	}
	
	return _current_value;
	
}