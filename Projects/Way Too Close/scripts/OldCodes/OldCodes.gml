// Distance with structs (OLD)
//findDistance	   = function(_pos, _area)
//{
//    var i = 0; repeat(array_length(_area))
//    {
//		if (array_length(distance) != array_length(_area))
//		{
//			array_resize(distance, array_length(_area));
//		}
//        if (!is_struct(distance[i]))
//        {
//            distance[i] = new Grid(_pos.x + _area[i][0], _pos.y + _area[i][1]);
//        }
//        else
//        {
//            distance[i].set(_pos.x + _area[i][0], _pos.y + _area[i][1]);
//        }
//        i++;
//    }
//}
//area = [
//	[0, 1],
//	[0, -1],
//	[1, 0],
//	[-1, 0]
//];
//findDistance(gridPos, area);

// if (i == DIR.RIGHT || i == DIR.LEFT)
// {
// 	_x = _area[i][j];
// 	_y = 0;
// }
// else if (i == DIR.UP || i == DIR.DOWN)
// {
// 	_x = 0;				
// 	_y = _area[i][j];
// }