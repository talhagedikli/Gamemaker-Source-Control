/*-----------------------------------------------------------------------------
Sin City Shader based on rgb: Desat everything except r, g or b
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This shader will only be able pop red, green or blue and works best with reds.

This shader is strongly based on a shader by TerrifyingCookie found on reddit:
https://www.reddit.com/r/gamedev/comments/271ljs/how_do_i_achieve_a_sin_city_look_using_a_hlsl/chwnbuw/

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float threshold;
	0 <= threshold <= 1
	0.05 - 0.2 looks good
	The lower the more reds are kept. From 0.2 on hardly any red stays.
	
uniform float threshold_range;
	0 >= threshold_range >= 1
	0.0  - 0.5 looks good
	Smooths the threshold.
	
uniform float brightness;
	-1 <= brightness <= 1
	-0.5 - 0.5 looks good
	0: no change in brightness
	only affects the grays
	
uniform float contrast;
	0 <= contrast
	1.0  - 4.0 looks good, above that there's hardly any difference
	only affects the grays
	
uniform float saturation;
	0 <= saturation
	0.8  - 1.5 looks good
	only affects the popping color
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite				= spr_whatever;
	shader				= shd_sin_city_effect;
	u_threshold			= shader_get_uniform(shader, "threshold");
	u_threshold_range	= shader_get_uniform(shader, "threshold_range");
	u_brightness		= shader_get_uniform(shader, "brightness");
	u_contrast			= shader_get_uniform(shader, "contrast");
	u_saturation		= shader_get_uniform(shader, "saturation");
	
Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f(u_threshold, 0.1);
		shader_set_uniform_f(u_threshold_range, 0.25);
		shader_set_uniform_f(u_brightness, -0.1);
		shader_set_uniform_f(u_contrast, 2.5);
		shader_set_uniform_f(u_saturation, 0.9);
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

