#macro GRID_WITH		16
#macro GRID_HEIGHT		16
#macro GRID_MARGIN		8

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
	static init = function()
	{
		with (other)
		{
			gx = other.toGx(x);	
			gy = other.toGy(y);	
		}
	}
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
	static collisionLine = function(_gx1, _gy1, _gx2, _gy2, _object, _prec, _notme)
	{
		return collision_line(toX(_gx1) + GRID_WITH*0.5, 
			toY(_gy1) + GRID_HEIGHT*0.5, toX(_gx2) + GRID_WITH*0.5, toX(_gy2) + GRID_HEIGHT*0.5, _object, _prec, _notme);	
	}
	static collisionCircle = function(_gx, _gy, _radius, _object, _prec, _notme)
	{
		return collision_circle(toX(_gx) + GRID_WITH*0.5, 
			toY(_gy) + GRID_HEIGHT*0.5, _radius*GRID_WITH, _object, _prec, _notme);	
	}
	static collisionCircleList = function(_gx, _gy, _radius, _object, _prec, _notme, _list, _ordered)
	{
		return collision_circle_list(toX(_gx) + GRID_WITH*0.5, 
			toY(_gy) + GRID_HEIGHT*0.5, _radius*GRID_WITH, _object, _prec, _notme, _list, _ordered);	
	}
	//static collisionCircle = function(_gx, _gy, _radius, _object, _prec, _notme)
	//{
	//	return collision_ellipse(toX(_gx) + GRID_WITH*0.5, 
	//		toY(_gy) + GRID_HEIGHT*0.5, _radius*GRID_WITH, _object, _prec, _notme);	
	//}
	
	
	
}
function __grInstance() 
{
	static instance = new Grider();
	return instance;
}

