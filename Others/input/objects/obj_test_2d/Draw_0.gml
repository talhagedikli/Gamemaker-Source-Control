var _string = "";
_string += "Left  = " + string(input_binding_get_name(input_binding_get(VERB.LEFT ))) + "\n";
_string += "Right = " + string(input_binding_get_name(input_binding_get(VERB.RIGHT))) + "\n";
_string += "Up    = " + string(input_binding_get_name(input_binding_get(VERB.UP   ))) + "\n";
_string += "Down  = " + string(input_binding_get_name(input_binding_get(VERB.DOWN ))) + "\n";
_string += "\n";
_string += "x = " + string(input_x(VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN)) + "\n";
_string += "y = " + string(input_y(VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN)) + "\n";
_string += "xy = " + string(input_xy(VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN)) + "\n";
_string += "direction = " + string(input_direction(VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN)) + "\n";
_string += "distance = " + string(input_distance(VERB.LEFT, VERB.RIGHT, VERB.UP, VERB.DOWN)) + "\n";

draw_text(10, 10, _string);