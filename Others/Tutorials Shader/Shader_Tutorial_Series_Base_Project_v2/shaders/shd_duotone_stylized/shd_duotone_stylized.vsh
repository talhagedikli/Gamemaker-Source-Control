/*-----------------------------------------------------------------------------
Duotone Stylized Shader: Simulate duotone process with a dark color and a light
color and crush the value range
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
-

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
duo_col_dark, array[r, g, b]
	The dark color as array of reals
	0: no value
	1: full value
	>1: is allowed and can be used to compensate <1 in other channels
	i.e: [1.2, 1.0, 0.8] is sepia-like
	
duo_col_light array[r, g, b]
	The dark color as array of reals
	0: no value
	1: full value
	<0: is allowed and can be used to compensate >0 in other channels
	i.e: [0.2, 0.0, -0.2]

crush, float
	0: no crushing
	0.5: full crushing
	> 0.5 starts inverting dark and light
	Crushes the value range of each channel. At 0.5 all details are lost and
	every pixel is either the dark or the light color.
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite = spr_whatever;
	shader			= shd_duotone_stylized;
	u_duo_col_dark	= shader_get_uniform(shader, "duo_col_dark");
	u_duo_col_light	= shader_get_uniform(shader, "duo_col_light");
	u_crush			= shader_get_uniform(shader, "crush");
	duo_col_dark	= [0.1, -0.4, 0.3];
	duo_col_light	= [1.2, 1.2, 0.6]; // Sepia is about [1.2, 1.0, 0.8]
	crush			= 0.3;
	
Draw event:
---------------------------------------
	shader_set(shader);
	shader_set_uniform_f_array(u_duo_col_dark, dark);
	shader_set_uniform_f_array(u_duo_col_light, light);
	shader_set_uniform_f(u_crush, 0.5);
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

