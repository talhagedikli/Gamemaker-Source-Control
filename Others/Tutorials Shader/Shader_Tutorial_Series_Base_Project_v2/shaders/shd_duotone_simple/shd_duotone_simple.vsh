/*-----------------------------------------------------------------------------
Duotone Simple Shader: Simulate duotone processing like in Sepia toning
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
-
_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
duo_col, vec3
	The color constant to tone with.
	Each value can be lower than 0 and higher than 1 but toghether should be
	more or less have an average of 1 to keep the brightness of the image.
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite		= spr_whatever;
	shader		= shd_duotone_simple;
	u_duo_col	= shader_get_uniform(shader, "duo_col");
	duo_col		= [1.2, 1.0, 0.8]; // Sepia is about [1.2, 1.0, 0.8]
	
Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f_array(u_duo_col, duo_col);
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

