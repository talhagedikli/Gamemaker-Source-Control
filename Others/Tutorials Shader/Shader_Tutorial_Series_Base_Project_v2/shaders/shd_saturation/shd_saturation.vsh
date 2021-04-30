/*-----------------------------------------------------------------------------
Saturation Shader: Changes the saturation of an image
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
-

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
gamma saturation
	0: B&W
	1: unchanged
	>1: saturated
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite = spr_whatever;
	shader = shd_saturation;
	u_saturation = shader_get_uniform(shader, "saturation");

Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f(u_saturation, 1.5);
		draw_sprite(sprite, 0, x, y);
	shader_reset();
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

