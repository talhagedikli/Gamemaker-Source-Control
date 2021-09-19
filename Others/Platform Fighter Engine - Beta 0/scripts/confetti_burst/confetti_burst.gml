///@func confetti_burst(x,y,direction,number,speed,direction_change)
///@param x
///@param y
///@param direction
///@param number
///@param speed
///@param direction_change
var _x=argument0;
var _y=argument1;
var _direction=argument2;
var _number=argument3;
var _speed=argument4;
var _change=argument5;
part_type_direction(global.p2,_direction-_change,_direction+_change,0,15);
part_type_orientation(global.p2,0,360,0,0,0);
part_type_speed(global.p2,_speed-5,_speed+5,-1.4,0);
repeat(_number)
	{
	part_type_color1(global.p2,palette_get_color(palette, 0));
	part_particles_create(global.part_sys,_x,_y,global.p2,1);
	}