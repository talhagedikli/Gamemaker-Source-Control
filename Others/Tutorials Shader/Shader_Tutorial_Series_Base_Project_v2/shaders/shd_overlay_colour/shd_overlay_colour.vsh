/*-----------------------------------------------------------------------------
Overlay Shader: Simulates Photoshops Overlay 
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This overlay isn't using v_vColour but instead a colour array. The advantage is
that this way colour channels cen be less than 0 and more than 1.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
col, vec3
	RGB of the overlaid colour
	Each omponent can be less than 0 and more than 1
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	u_col = shader_get_uniform(shd_overlay_colour, "col");
	
Draw event:
---------------------------------------
	shader_set(shd_overlay_colour);
	shader_set_uniform_f_array(u_col, [1.2, 0.5, -0.1]);
	draw_sprite(spr_whatever, 0, x, y);
	shader_reset();
*/

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
//attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
//varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
//    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

