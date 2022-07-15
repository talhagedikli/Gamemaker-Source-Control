#macro GRID_WITH		16
#macro GRID_HEIGHT		16
#macro GRID_MARGIN		8

//function grid_meeting(_x, _y, _object)
//{
//	return place_meeting(gridx_to_x(_x)+GRID_MARGIN, gridy_to_y(_y)+GRID_MARGIN, _object);
//}

//function instance_place_grid(_x, _y, _object)
//{
//	return instance_place(gridx_to_x(_x)+GRID_MARGIN, gridy_to_y(_y)+GRID_MARGIN, _object);
//}
//function instance_place_list_grid(_x, _y, _object, _list, _ordered)
//{
//	return instance_place_list(gridx_to_x(_x)+GRID_MARGIN, gridy_to_y(_y)+GRID_MARGIN, _object,
//		_list, _ordered);
//}
//function collision_rectangle_grid(_x1, _y1, _x2, _y2, _object, _prec, _notme)
//{
//	var m = GRID_MARGIN;
//	return collision_rectangle(gridx_to_x(_x1)+m, gridy_to_y(_y1)+m, 
//		gridx_to_x(_x2)-m, gridy_to_y(_y2)-m, _object, _prec, _notme);	
//}

//function place_empty_grid(_x, _y, _object=noone)
//{
//	var m = GRID_MARGIN;
//	if (_object == noone)
//	{
//		return place_empty(x_to_gridx(_x)+m, y_to_gridy(_y)+m);	
//	}
//	else
//	{
//		return place_empty(x_to_gridx(_x)+m, y_to_gridy(_y)+m, _object);	
//	}
//}


//function x_to_gridx(_x)
//{
//	return _x div GRID_WITH;
//}
//function y_to_gridy(_y, _add_margin=0)
//{
//	return _y div GRID_HEIGHT;
//}
//function gridx_to_x(_gx)
//{
//	return _gx*GRID_WITH;
//}
//function gridy_to_y(_gy)
//{
//	return _gy*GRID_HEIGHT;
//}

#macro gr __grInstance()
enum GridOperations 
{
	Add,
	Substact,
	Multiply,
	Divide,
	Div,
	Mod,
	Equality
}
function Grider() constructor
{
	static width	= GRID_WITH;
	static height	= GRID_HEIGHT;
	static margin	= GRID_MARGIN;
	static toX = function(_gx)
	{
		return _gx*GRID_WITH;
	}
	static toY = function(_gy)
	{
		return _gy*GRID_HEIGHT;
	}
	static toGx = function(_x)
	{
		return _x div GRID_WITH;	
	}
	static toGy = function(_y)
	{
		return _y div GRID_HEIGHT;	
	}
	static stick = function()
	{
		var xx = gr.toGx(other.x);	
		var yy = gr.toGy(other.y);
		other.x = gr.toX(xx);
		other.y = gr.toY(yy);
	}
	static collisionPoint = function(_gx, _gy, _object, _prec, _notme)
	{
		return collision_point(toX(_gx) + GRID_WITH*0.5, 
			toY(_gy) + GRID_HEIGHT*0.5, _object, _prec, _notme);	
	}

	
	
}
function __grInstance() 
{
	static instance = new Grider();
	return instance;
}

