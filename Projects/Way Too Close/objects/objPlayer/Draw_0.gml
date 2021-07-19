/// @description
draw_sprite_ext(sprite_index, image_index, x, y, xScale * facing, yScale,
				image_angle, image_blend, image_alpha);
				
var cx = CAM_X, cy = CAM_Y, cw = CAM_W, ch = CAM_H;

draw_set_color($232322);
draw_rectangle(cx, cy + ch - 2 * GRID_H, cx + cw, cy + ch, false);
draw_rectangle(cx, cy, cx + cw, cy + 2 * GRID_H, false);
draw_set_color(c_white);

// Draw grid distance
var gm	= 2,
x1, x2, y1, y2, tc	= c_white, ta	= 0.8;
var i	= 0; repeat(array_length(distance))
{
	x1 = distance[i].x;
	x2 = distance[i].x + 1;
	y1 = distance[i].y;
	y2 = distance[i].y + 1;
	var gr = distance[i];
	if (gridMeeting(gr.x, gr.y, objEnemyParent))
	{
		gr.blend(merge_color(gr.color, c_red, 0.1), approach(gr.alpha, 1, 0.1));
	}
	else
	{
		gr.blend(merge_color(gr.color, c_white, 0.1), approach(gr.alpha, 0.8, 0.1));
	}
	CleanRectangle(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm).Blend(gr.color, gr.alpha).Border(2, c_white, 0.8).Rounding(5).Draw();
	i++;
}

// Draw wepons
var scale	= 2, margin	= 0;
var _len	= 0;

var i = 0; repeat(ds_list_size(wepons))
{
	var _item	= wepons[| i];
	var _sw		= sprite_get_width(_item.sprite);
	var _sh		= sprite_get_height(_item.sprite);
	if (_len == floor(focused))
	{
		_item.color = merge_color(_item.color, c_red, abs(dsin(current_time / 100)));
		_item.alpha = flerp(_item.alpha, 1, 0.1);
	}
	else
	{
		_item.color	= merge_color(_item.color, c_white, .1);
		_item.alpha = flerp(_item.alpha, 1, 0.1);
	}
	draw_sprite_ext(_item.sprite, _item.index, cx + i * (_sw * scale + margin), cy + ch - _sh * scale, scale, scale, 0, _item.color, _item.alpha);
	_len++;
	i++;
}

// Draw Health
//var i = 0; repeat(hp)
//{
//	draw_sprite_ext(sprHeart, 0, cx + i * sprite_get_width(sprHeart) * scale, cy + sprite_get_height(sprHeart) * scale, scale, scale, 0, 0, 1);
//	i++;
//}
