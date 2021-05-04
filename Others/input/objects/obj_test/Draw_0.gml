var _string = "";

_string += "Gamepad " + string(test_index) + "/" + string(gamepad_get_device_count()) + ", \"" + string(gamepad_get_description(test_index)) + "\"\n";

var _gamepad = test_index;
var _i = 0;
repeat(40)
{
    if (gamepad_button_check(_gamepad, _i))
    {
        _string += "b" + string(_i) + "\n";
    }
    
    ++_i;
}

var _i = 0;
repeat(10)
{
    if (gamepad_hat_value(_gamepad, _i))
    {
        _string += "h" + string(_i) + " = " + string(gamepad_hat_value(_gamepad, _i)) + "\n";
    }
    
    ++_i;
}

var _i = 0;
repeat(12)
{
    _string += "a" + string(_i) + " = " + string(gamepad_axis_value(_gamepad, _i)) + "\n";
    ++_i;
}

_string += "a4106 = " + string(gamepad_axis_value(_gamepad, 4106)) + "\n";
_string += "a4107 = " + string(gamepad_axis_value(_gamepad, 4107)) + "\n";

draw_text(10, 10, _string);

var _string = "";
_string += "gp_face1      = " + string(input_gamepad_value(_gamepad, gp_face1     )) + "\n";
_string += "gp_face2      = " + string(input_gamepad_value(_gamepad, gp_face2     )) + "\n";
_string += "gp_face3      = " + string(input_gamepad_value(_gamepad, gp_face3     )) + "\n";
_string += "gp_face4      = " + string(input_gamepad_value(_gamepad, gp_face4     )) + "\n";
_string += "gp_padu       = " + string(input_gamepad_value(_gamepad, gp_padu      )) + "\n";
_string += "gp_padd       = " + string(input_gamepad_value(_gamepad, gp_padd      )) + "\n";
_string += "gp_padl       = " + string(input_gamepad_value(_gamepad, gp_padl      )) + "\n";
_string += "gp_padr       = " + string(input_gamepad_value(_gamepad, gp_padr      )) + "\n";
_string += "gp_axislh     = " + string(input_gamepad_value(_gamepad, gp_axislh    )) + "\n";
_string += "gp_axislv     = " + string(input_gamepad_value(_gamepad, gp_axislv    )) + "\n";
_string += "gp_axisrh     = " + string(input_gamepad_value(_gamepad, gp_axisrh    )) + "\n";
_string += "gp_axisrv     = " + string(input_gamepad_value(_gamepad, gp_axisrv    )) + "\n";
_string += "gp_stickl     = " + string(input_gamepad_value(_gamepad, gp_stickl    )) + "\n";
_string += "gp_stickr     = " + string(input_gamepad_value(_gamepad, gp_stickr    )) + "\n";
_string += "gp_shoulderl  = " + string(input_gamepad_value(_gamepad, gp_shoulderl )) + "\n";
_string += "gp_shoulderlb = " + string(input_gamepad_value(_gamepad, gp_shoulderlb)) + "\n";
_string += "gp_shoulderr  = " + string(input_gamepad_value(_gamepad, gp_shoulderr )) + "\n";
_string += "gp_shoulderrb = " + string(input_gamepad_value(_gamepad, gp_shoulderrb)) + "\n";
_string += "gp_select     = " + string(input_gamepad_value(_gamepad, gp_select    )) + "\n";
_string += "gp_start      = " + string(input_gamepad_value(_gamepad, gp_start     )) + "\n";

draw_text(270, 30, _string);



draw_rectangle(488, 0, 490, room_height, false);

var _string = "";

_string += "Left          = " + string(input_value(VERB.LEFT   )) + "    " + string(input_binding_get(VERB.LEFT   )) + "\n";
_string += "Right         = " + string(input_value(VERB.RIGHT  )) + "    " + string(input_binding_get(VERB.RIGHT  )) + "\n";
_string += "Up            = " + string(input_value(VERB.UP     )) + "    " + string(input_binding_get(VERB.UP     )) + "\n";
_string += "Down          = " + string(input_value(VERB.DOWN   )) + "    " + string(input_binding_get(VERB.DOWN   )) + "\n";
_string += "Confirm       = " + string(input_value(VERB.CONFIRM)) + "    " + string(input_binding_get(VERB.CONFIRM)) + "\n";
_string += "Cancel        = " + string(input_value(VERB.CANCEL )) + "    " + string(input_binding_get(VERB.CANCEL )) + "\n";
_string += "Pause         = " + string(input_value(VERB.PAUSE  )) + "    " + string(input_binding_get(VERB.PAUSE  )) + "\n";
_string += "Recent (all)  = " + string(input_check_press_most_recent()) + "\n";
_string += "Recent (4dir) = " + string(input_check_press_most_recent([VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN])) + "\n";

draw_text(500, 10, _string);

draw_text(500, 740, current_time);