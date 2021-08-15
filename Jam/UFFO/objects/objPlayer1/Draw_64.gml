var gw = GUI_W, gh = GUI_H;
var h = 3;
dashRate = flerp(dashRate, dashDur / dashDurMax, 0.15);
draw_set_color(merge_color(c_red, c_white, dashRate));
draw_set_alpha(dashRate < 0.3 ? dsin(current_time * 2) * 0.5 + 0.5 : 1);
draw_rectangle(0, gh - h, gw * dashRate, gh, false);
draw_set_alpha(1);
draw_set_color(c_white);
// Draw icons
var scl = 5, sw = scl * sprite_get_width(wepon.sprite), sh = scl * sprite_get_height(wepon.sprite);
if (is_struct(bounity)) draw_sprite_ext(wepon.sprite, wepon.index, gw - sw, gh, scl, scl, 0, c_white, 1);
if (is_struct(bounity)) draw_sprite_ext(wepon.sprite, bounity.index, 0, gh, scl, scl, 0, c_white, 1);




