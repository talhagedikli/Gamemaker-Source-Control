/// @description Insert description here
// You can write your code in this editor
//if (is_array(grid[0]))
//{
//	var i = 0; repeat(array_length(grid[0]))
//	{
//		draw_line(i * 32, 0, i * 32, room_height);
//		i++;
//	}
//}

draw_rectangle(testGr.x * GRID_W, testGr.y * GRID_H, (testGr.x + testGr.xScale) * GRID_W, 
				(testGr.y + testGr.yScale) * GRID_H, false);