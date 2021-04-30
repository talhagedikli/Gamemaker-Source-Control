
if objPlayer.currentState == states.dash shader_set(shFlash);
draw_self();
shader_reset();
//draw_circle(x, y - sprite_yoffset/2, 25, true);