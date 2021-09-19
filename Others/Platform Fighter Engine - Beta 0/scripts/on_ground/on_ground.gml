///@func on_ground([x],[y]);
///@param [x]
///@param [y]
var _x,_y;
_x = argument_count > 0 ? argument[0] : x;
_y = argument_count > 1 ? argument[1] : y;

return (on_solid(_x, _y) || on_plat(_x, _y));