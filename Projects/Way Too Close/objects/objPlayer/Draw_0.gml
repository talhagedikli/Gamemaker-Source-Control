/// @description
draw_sprite_ext(sprite_index, image_index, x, y, xScale * facing, yScale,
				image_angle, image_blend, image_alpha);
				



draw_set_color($232322);
draw_rectangle(cx, cy + ch - 2 * GRID_H, cx + cw, cy + ch, false);
draw_rectangle(cx, cy, cx + cw, cy + 2 * GRID_H, false);
draw_set_color(c_white);

// Draw grid distance
var gm	= 2,
x1, x2, y1, y2, tc	= c_white, ta	= 0.8;
// var i	= 0; repeat(array_length(distance))
// {
// 	x1 = distance[i].x;
// 	x2 = distance[i].x + 1;
// 	y1 = distance[i].y;
// 	y2 = distance[i].y + 1;
// 	var gr = distance[i];
// 	if (gridMeeting(gr.x, gr.y, objEnemyParent))
// 	{
// 		gr.blend(merge_color(gr.color, c_red, 0.1), approach(gr.alpha, 1, 0.1));
// 	}
// 	else
// 	{
// 		gr.blend(merge_color(gr.color, c_white, 0.1), approach(gr.alpha, 0.8, 0.1));
// 	}
// 	CleanRectangle(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm).Blend(gr.color, gr.alpha).Border(2, c_white, 0.8).Rounding(5).Draw();
// 	i++;
// }
foreach(distance as (grid, index)
{
	var x1 = distance[index].x,
	x2 = distance[index].x + 1,
	y1 = distance[index].y,
	y2 = distance[index].y + 1,
	gm = 2;
	if (gridMeeting(grid.x, grid.y, objEnemyParent))
	{
		grid.blend(merge_color(grid.color, c_red, 0.1), approach(grid.alpha, 1, 0.1));
	}
	else
	{
		grid.blend(merge_color(grid.color, c_white, 0.1), approach(grid.alpha, 0.8, 0.1));
	}
	CleanRectangle(x1 * GRID_W + gm, y1 * GRID_H + gm, x2 * GRID_W - gm, y2 * GRID_H - gm).Blend(grid.color, grid.alpha).Border(2, c_white, 0.8).Rounding(5).Draw();	
})

// Draw wepons
var scale	= 2, margin	= 0;
var wi	= 0;

var i = 0; repeat(array_length(inventory))
 {
 	var it	= inventory[i],
 	sw		= sprite_get_width(it.sprite),
 	sh		= sprite_get_height(it.sprite),
 	x1		= cx + i * (sw * scale + margin),
 	y1		= cy + ch - sh * scale;
	
 	if (i == floor(focused))
 	{
 		it.color = merge_color(it.color, c_white, abs(dsin(current_time / 100)));
 		it.alpha = flerp(it.alpha, 1, 0.1);
 	}
 	else
 	{
 		it.color	= merge_color(it.color, c_white, .1);
 		it.alpha = flerp(it.alpha, 0.4, 0.1);
 	}
 	if (it.type == ITEM.WEPON)
 	{
 		// Draw wepon
 		draw_sprite_ext(it.sprite, it.index, x1, y1, scale, scale, 0, it.color, it.alpha);
 		// Draw wepon count
 		draw_set_font(fntText);
 		draw_set_halign(fa_left);
 		draw_set_valign(fa_top);
 		draw_text(x1, y1, it.count);
 		i++;
 	}
 }
//foreach(inventory as (item, index, scale = 2, margin = 0)
//{
//	var cx	= CAM_X, cy = CAM_Y, cw = CAM_W, ch = CAM_H,
//	sw		= sprite_get_width(item.sprite),
//	sh		= sprite_get_height(item.sprite),
//	x1		= cx + index * (sw * scale + margin),
//	y1		= cy + ch - sh * scale;
//	show(wi);
//	if (index == floor(focused))
//	{
//		item.color = merge_color(item.color, c_white, abs(dsin(current_time / 100)));
//		item.alpha = flerp(item.alpha, 1, 0.1);
//	}
//	else
//	{
//		item.color	= merge_color(item.color, c_white, .1);
//		item.alpha = flerp(item.alpha, 0.4, 0.1);
//	}
//	if (item.type == ITEM.WEPON)
//	{
//		// Draw wepon
//		draw_sprite_ext(item.sprite, item.index, x1, y1, scale, scale, 0, item.color, item.alpha);
//		// Draw wepon count
//		draw_set_font(fntText);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_top);
//		draw_text(x1, y1, item.count);
//	}	
//})

 // Draw Health
var sw = sprite_get_width(sprHeart), sh = sprite_get_height(sprHeart);
var i = 0; repeat(hp)
{
	draw_sprite_ext(sprHeart, 0, cx + i * sw * scale, cy, scale, scale, 0, c_white, 0.6);
	//draw_sprite_ext(sprHeart, 0, cx + i * sprite_get_width(sprHeart) * scale, cy + sprite_get_height(sprHeart) * scale, scale, scale, 0, 0, 1);
	i++;
}

