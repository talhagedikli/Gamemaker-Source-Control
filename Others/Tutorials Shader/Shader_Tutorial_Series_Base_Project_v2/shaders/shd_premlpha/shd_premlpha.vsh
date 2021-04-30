/*-----------------------------------------------------------------------------
Premutliply Alpha Shader: Multiplies each fragments alpha into it's color
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
Used in conjunction with bm_ext(bm_one, bm_inv_src_alpha) to draw on surfaces.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
-
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Draw event:
---------------------------------------
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);

if !surface_exists(srf) {
	srf = surface_create(srf_size, srf_size);
	
	surface_set_target(srf);
	draw_clear_alpha(c_black, 0);
	shader_set(shd_premultply_alpha);

	draw_sprite(spr_1, 0, 0, 0);
	draw_sprite(spr_2, 0, 0, 0);
	
	shader_reset();
	surface_reset_target();
}

draw_surface(srf, srf_x, srf_y);
gpu_set_blendmode(bm_normal);
*/

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

