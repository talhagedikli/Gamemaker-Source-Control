/// @description
draw_sprite_ext(sprite_index, image_index, x, y, xScale * facing, yScale,
				image_angle, image_blend, image_alpha);
				
var cx = CAM_X;
var cy = CAM_Y;
var cw = CAM_W;
var ch = CAM_H;

// Draw grid distance
var gm	= 2;
var x1, x2, y1, y2;
var tc	= c_white;
var ta	= 0.8;
var i	= 0; repeat(array_length(distance))
{
	x1 = distance[i].x;
	x2 = distance[i].x + 1;
	y1 = distance[i].y;
	y2 = distance[i].y + 1;
	var gr = distance[i];
	
	if (gridMeeting(gr.x, gr.y, objEnemyParent))
	{
		tc = C_CRIMSON;
		ta	= 1;
	}
	else
	{
		tc = c_white;
		ta = 0.8;
	}
	//var type = gridPlace(gr.x, gr.y, objEnemyParent);
	//if (type == objBlock)
	//{
	//	show("block");
	//}
	gr.blend(merge_color(gr.color, tc, 0.1), approach(gr.alpha, ta, 0.1));
	CleanRectangle(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm).Blend(gr.color, gr.alpha).Border(2, c_white, 0.8).Rounding(4).Draw();
	i++;
}

// Draw inventory
var scale	= 2;
var margin	= 0;
//draw_set_color(c_black);
//draw_rectangle(cx + margin - sprite_get_width(sprSword) * scale, cy + ch - sprite_get_height(sprSword) * scale, cx + cw, cy + ch, false);
//draw_set_color(c_white);
var i = 0; repeat(ds_list_size(inventory))
{
	var spr		= inventory[| i].sprite;
	draw_sprite_ext(spr, 0, cx + i * (sprite_get_width(spr) * scale + margin), cy + ch - sprite_get_height(spr) * scale, scale, scale, 0, c_white, 1);
	i++;
}


