//shader_set(shTempFlash);
//shader_set_uniform_f(uniDur, flashDur);

//if (flashDur > 0) flashDur--;
//flashDur = clamp(flashDur, 0, 60);

//DRAW LIGHTNING SURFACE
if (!surface_exists(srfLights))
{
	var _surW = surface_get_width(application_surface);
	var _surH = surface_get_height(application_surface);
	srfLights = surface_create(_surW, _surH);
	texLights = surface_get_texture(srfLights);
}

surface_set_target(srfLights);

//setup surface and gpu
draw_clear(c_black);
gpu_set_blendmode(bm_add);
gpu_set_tex_filter(true); //optional scale problems

//draw light sprites (scaled)
var _lightStrength = global.slider0;
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
//var _vh = camera_get_view_height(VIEW);
var _gw = display_get_gui_width();
//var _gh = display_get_gui_height();
var _vs = _gw/_vw;

with (objLightParent)
{
	//var _block = instance_place(x, y, objGround);
	//var tx, ty, dw, dh;
	//if _block = noone {
	//	tx = 0;
	//	ty = 0;
	//	dw = sprite_width;
	//	dh = sprite_height;
	//} else {
	//	tx = _block.x;
	//	ty = _block.y;
	//	dw = abs(_block.x - (x-sprite_xoffset));
	//	dh = abs(_block.y - (y-sprite_yoffset));
	//}
	
	//draw_sprite_part_ext(sprite_index, image_index, tx, ty, dw, dh, 
	//					_vs*(x - _vx) - sprite_width, _vs*(y - _vy) - sprite_height, 
	//					image_xscale * _vs, image_yscale * _vs, 
	//					image_blend, image_alpha * _lightStrength);  
	draw_sprite_ext(sprite_index, image_index, _vs*(x - _vx), _vs*(y - _vy), 
						image_xscale * _vs, image_yscale * _vs, 
						image_angle, image_blend, image_alpha * _lightStrength);
}

//reset gpu
surface_reset_target();
gpu_set_blendmode(bm_normal);
gpu_set_tex_filter(false); //optional scale problems

//shader_set(shOutline);
//		shader_set_uniform_f(uniPixelW, texelH);
//		shader_set_uniform_f(uniPixelH, texelW);
//		texture_set_stage(sLights, texLights);
//with (objPlayer) {

//		draw_sprite_ext(sprite_index, image_index, _vs*xPos, _vs*yPos, _vs*xScale * facing, _vs*yScale,
//					angle, color, alpha);
//}
//shader_reset();


//draw application surface
shader_set(shader);
//shader_set_uniform_f(uniBlockPos, objGround.x, objGround.y)
//shader_set_uniform_f(uniLightPos, objLightParent.x, objLightParent.y)
shader_set_uniform_f_array(uniCol, color);
shader_set_uniform_f_array(uniConSatBrt, conSatBrt);
//shader_set_uniform_f(uniTrans, global.midTransition);
texture_set_stage(sLights, texLights);

if (surface_exists(application_surface))
	draw_surface(application_surface, 0, 0);

shader_reset();

