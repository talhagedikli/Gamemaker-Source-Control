function Vector2(_x = undefined, _y = _x) constructor
{
	self.x	= _x;
	self.y	= _y;
	/// @func set()
	static set = function(_x, _y) 
	{
		x = _x;
		y = _y;
	}
	static add = function(_vector) 
	{
		x += _vector.x;
		y += _vector.y;
	}
	/// @func subtract()
	static subtract = function(_vector) 
	{
		x -= _vector.x;
		y -= _vector.y;
	}
	/// @func multiply(scalar)
	static multiply = function(_scalar) 
	{
		x *= _scalar;
		y *= _scalar;
	}
	/// @func divide()
	static divide = function(_scalar) 
	{
		x /= _scalar;
		y /= _scalar;
	}
	/// @func negate()
	static negate = function()
	{
		x = -x;
		y = -y;
	}
	/// @func normalize()
	static normalize = function() {
		if ((x != 0) || (y != 0)) {
			var _factor = 1/sqrt((x * x) + (y *y));
			x = _factor * x;
			y = _factor * y;	
		}
	}
	/// @func set_magnitude(_scalar)
	/// @desc Sets the magnitude of the vector
	static set_magnitude = function(_scalar) {
		normalize();
		multiply(_scalar);
	}
	/// @func limit_magnitude()
	static limit_magnitude = function(_limit) {
		if (length() > _limit) {
			set_magnitude(_limit);
		}
	}
	/// @func copy()
	static copy = function(_vector2)
	{
		x = _vector2.x;
		y = _vector2.y;
	}
	
	/// @func absv()
	/// @desc Returns a new vector with all components in absolute values.
	static absv = function()
	{
	    return (new Vector2(abs(x), abs(y)));
	}

	/// @func angle(radians)
	/// @desc Returns this vector's angle with respect to the X axis.
	static angle = function(radians)
	{
	    return (radians) ? arctan2(y, x) : darctan2(y, x);
	}

	/// @func length()
	/// @desc Returns the length (magnitude) of this vector.
	static length = function()
	{
	    return point_distance(0, 0, x, y);
	}

	/// @func length_squared()
	/// @desc Returns the squared length (squared magnitude) of this vector. Faster than length().
	static length_squared = function()
	{
	    return (x * x + y * y);
	}

	/// @func normalize()
	/// @desc Normalizes the vector's components to be between 0 and 1.
	static normalize = function()
	{
	    var _l = length_squared();
	    if (_l != 0)
	    {
	        _l = sqrt(_l);
	        x = x / _l;
	        y = y / _l;
	    }
	}

	/// @func normalized()
	/// @desc Returns the vector scaled to unit length.
	static normalized = function()
	{
	    var _vector = self;
	    _vector.normalize();
	    return _vector;
	}

	/// @func is_normalized()
	/// @desc Returns true if the vector is normalized, and false otherwise.
	static is_normalized = function()
	{
	    var _epsilon = 0.0001;
	    var _difference = abs(length_squared() - 1.0);
	    return (_difference < _epsilon);
	}

	/// @func distance_to()
	/// @param vector2
	/// @desc Returns the distance between the two vectors.
	static distance_to = function(vector2)
	{
	    var _check = instanceof(vector2);
	    if (is_string(_check))
	    {
	        return sqrt((x - vector2.x) * (x - vector2.x) + (y - vector2.y) * (y - vector2.y));
	    }
	    else
	    {
	        return undefined;
	    }
	}

	/// @func distance_to_squared()
	/// @param vector2
	/// @desc Returns the squared distance between the two vectors. Faster than distance_to().
	static distance_to_squared = function(vector2)
	{
	    var _check = instanceof(vector2);
	    if (is_string(_check))
	    {
	        return ((x - vector2.x) * (x - vector2.x) + (y - vector2.y) * (y - vector2.y));
	    }
	    else
	    {
	        return undefined;
	    }
	}

	/// @func angle_to()
	/// @param vector2
	/// @param {bool} return_radians
	/// @desc Returns the angle to the given vector.
	static angle_to = function(vector2, radians)
	{
	    var _check = instanceof(vector2);
	    if (is_string(_check))
	    {
	        return (radians) ? arctan2(cross(vector2), dot(vector2)) : darctan2(cross(vector2), dot(vector2));
	    }
	    else
	    {
	        return undefined;
	    }
	}

	/// @func angle_to_point()
	/// @param vector2
	/// @param {bool} return_radians
	/// @desc Returns the angle between the line connecting the two points and the X axis.
	static angle_to_point = function(vector2, radians)
	{
	    var _check = instanceof(vector2);
	    if (is_string(_check))
	    {
	        return (radians) ? arctan2(y - vector2.y, x - vector2.x) : darctan2(y - vector2.y, x - vector2.x);
	    }
	    else
	    {
	        return undefined;
	    }
	}

	/// func dot()
	/// @param vector2
	/// @desc Returns the dot product.
	static dot = function(vector2)
	{
	    return (x * vector2.x + y * vector2.y);
	}

	/// @func cross(vector2)
	/// @param vector2
	/// @desc Returns the cross product.
	static cross = function(vector2)
	{
	    return (x * vector2.x - y * vector2.y);
	}

	/// @func signv()
	/// @desc Returns the vector with each component set to one or negative one, depending on the signs of the components, or zero if the component is zero.
	static signv = function()
	{
	    return (new Vector2(sign(x), sign(y)));
	}

	/// @func floorv()
	/// @desc Returns the vector with all components rounded down.
	static floorv = function()
	{
	    return (new Vector2(floor(x), floor(y)));
	}

	/// @func ceilv()
	/// @desc Returns the vector with all components rounded up.
	static ceilv = function()
	{
	    return (new Vector2(ceil(x), ceil(x)));
	}

	/// @func roundv()
	/// @desc Returns the vector with all components rounded.
	static roundv = function()
	{
	    return (new Vector2(round(x), round(y)));
	}

	/// @func rotated()
	/// @param by_amount
	/// @param {bool} by_radians?
	/// @desc Returns the vector rotated by the amount supplied in degrees or radians.
	static rotated = function(by_amount, radians)
	{
	    var _sine = (radians) ? sin(by_amount) : dsin(by_amount);
	    var _cosi = (radians) ? cos(by_amount) : dcos(by_amount);
	    return (new Vector2(x * _cosi - y * _sine, x * _sine + y * _cosi));
	}

	/// @func project()
	/// @param vector2
	/// @desc Returns the vector projected onto the given vector.
	static project = function(vector2)
	{
	    return (vector2 * (dot(vector2) / vector2.length_squared()));
	}

	/// @func snapped()
	/// @param vector2
	/// @desc Returns this vector with each component snapped to the nearest multiple of step.
	static snapped = function(vector2)
	{
	    return new Vector2(floor(x / vector2.x + 0.5) * vector2.x, floor(y / vector2.y + 0.5) * vector2.y);
	}

	/// @func clamped()
	/// @param max_length
	/// @desc Returns the vector with a maximum length by limiting its length to length.
	static clamped = function(max_length)
	{
	    var _length = length();
	    var _vector = self;
	    if (_length > 0 and max_length < _length)
	    {
	        _vector.x /= _length;
	        _vector.y /= _length;
	        _vector.x *= max_length;
	        _vector.y *= max_length;
	    }

	    return _vector;
	}

	/// @func move_toward()
	/// @param vector2
	/// @param delta
	/// @desc Moves the vector toward vector2 by the fixed delta amount.
	static move_toward = function(vector2, delta)
	{
	    var _vector = self;
	    var _epsilon = 0.0001;
	    var _vector_delta = new Vector2(vector2.x - _vector.x, vector2.y - _vector.y);
	    var _length = _vector_delta.length();

	    if (_length <= delta or _length < _epsilon)
	    {
	        return vector2;
	    }
	    else
	    {
	        return new Vector2(_vector.x + _vector_delta.x / _length * delta, _vector.y + _vector_delta.y / _length * delta);
	    }
	}

	/// @func is_approx_equal()
	/// @param vector2
	/// @desc Returns true if this vector and v are approximately equal.
	static is_approx_equal = function(vector2)
	{
	    var _epsilon = 0.0001;
	    var _x_difference = abs(x - vector2.x);
	    var _y_difference = abs(y - vector2.y);
	    return (_x_difference < _epsilon and _y_difference < _epsilon);
	}
	
	/// @func is_equal()
	/// @param vector2
	static is_equal = function(vector2)
	{
		return vector2.x == x && vector2.y == y;
	}

	static toString = function()
	{
	    return ("{" + string(x) + ", " + string(y) + "}");
	}
	
}

function Vector3(_x = undefined, _y = undefined, _z = undefined) constructor
{
	x = _x;
	y = _y;
	z = _z;
	return self;	
}










