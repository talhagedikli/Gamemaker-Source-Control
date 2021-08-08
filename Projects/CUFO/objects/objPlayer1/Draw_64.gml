var gw = GUI_W, gh = GUI_H;
var h = 3;
dashRate = flerp(dashRate, dashDur / dashDurMax, 0.15);
draw_set_color(merge_color(c_red, c_white, dashRate));
draw_set_alpha(dashRate < 0.3 ? dsin(current_time * 2) * 0.5 + 0.5 : 1);
draw_rectangle(0, gh - h, gw * dashRate, gh, false);
draw_set_alpha(1);
draw_set_color(c_white);
