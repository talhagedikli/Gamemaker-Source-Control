/// @description

if currentState == states.dash shader_set(shFlash);
draw_sprite_ext(sprite, frame, xPos, yPos, xScale * facing, yScale,
				angle, color, alpha);
shader_reset();




//if (oLight == noone)
//{
//	oLight = instance_place(x, y, objLightParent);
//	tLight = sprite_get_texture(oLight.sprite_index, 0);
//}
//else
//{
//	shader_set(shOutline);
//	shader_set_uniform_f(uniPixelW, texelH);
//	shader_set_uniform_f(uniPixelH, texelW);
//	texture_set_stage(sLights, tLight);
//}


	
//	draw_sprite_ext(sprite, frame, xPos, yPos, xScale * facing, yScale,
//			angle, color, alpha);

//shader_reset();