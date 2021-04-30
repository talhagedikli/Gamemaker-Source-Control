/*-----------------------------------------------------------------------------
Desaturation Simple Shader: equalizes color values to greyscale
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
-
_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
float strength
	>= 0 <= 1
	how much the colors get desaturated
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------
Create event:
---------------------------------------
	sprite		= spr_whatever;
	shader		= shd_desaturate;
	u_strength	= shader_get_uniform(shader, "strength");
	
Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f(u_strength, 0.5);
		draw_sprite(sprite_1, 0, x, y);
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

