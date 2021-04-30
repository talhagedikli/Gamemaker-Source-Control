/// @description

if currentState == states.dash shader_set(shFlash);
draw_sprite_ext(sprite, frame, xPos, yPos, xScale * facing, yScale,
				angle, color, alpha);
shader_reset();
