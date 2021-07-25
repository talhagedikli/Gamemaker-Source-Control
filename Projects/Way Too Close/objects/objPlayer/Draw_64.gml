var gw = GUI_W;
var gh = GUI_H;

var scale	= 4;
var bc		= c_black,
wc			= c_white;

display_set_gui_size(-1, -1);
draw_set_alpha(invBgAlpha);
draw_rectangle_color(0, 0, gw, gh, bc, bc, bc, bc, false);
draw_set_alpha(1);
if (invBgAlpha > 0)
{
	var i = 0; repeat(array_length(inventory))
	{
		var item	= inventory[i],
		sw			= sprite_get_width(item.sprite) * scale,
		sh			= sprite_get_height(item.sprite) * scale,
		xg			= gw div sw,
		yg			= gh div sh,
		xm			= xg / 4 * sw,
		ym			= yg / 4 * sh,
		x1			= i * sw + xm,
		y1			= 0 + ym;
		draw_sprite_ext(item.sprite, item.index, x1, y1, 
							scale, scale, 0, item.color, showInv ? item.alpha : item.alpha * invBgAlpha);
		i++;
		// Draw wepon count
		draw_set_font(fntText);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_alpha(invBgAlpha)
		draw_set_color(bc);
		draw_rectangle_color(x1, y1, x1 + 10, y1 + 10, bc, bc, bc, bc, false);
		draw_set_alpha(1);
		draw_set_color(wc);
		draw_text_color(x1, y1, item.count, wc, wc, wc, wc, invBgAlpha);
	}
}
// Draw wepons
//var scale	= 2, margin	= 0;

//var i = 0; repeat(ds_list_size(wepons))
//{
//	var it	= wepons[| i],
//	sw		= sprite_get_width(it.sprite),
//	sh		= sprite_get_height(it.sprite),
//	x1		= i * (sw * scale + margin),
//	y1		= gh - (sh * scale);
//	if (i == floor(focused))
//	{
//		it.color = merge_color(it.color, c_white, abs(dsin(current_time / 100)));
//		it.alpha = flerp(it.alpha, 1, 0.1);
//	}
//	else
//	{
//		it.color	= merge_color(it.color, c_white, .1);
//		it.alpha = flerp(it.alpha, 0.4, 0.1);
//	}
//	draw_sprite_ext(it.sprite, it.index, x1, y1, scale, scale, 0, it.color, it.alpha);
//	draw_set_font(fntText);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_text(x1, y1, it.count);
//	i++;
//}