/*-----------------------------------------------------------------------------
Brightness, Contrast & Saturation Shader
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
The code of the function "ContrastSaturationBrightness"
is from TGM's shader pack available here:
http://irrlicht.sourceforge.net/phpBB2/viewtopic.php?t=21057

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
brightness	float
	0: black
	1: unchanged
	>1: brighten (never reaches white)
	
contrast	float
	0: middle grey
	1: unchanged
	>1: increased contrast	
	
saturation	float
	0: B&W
	1: unchanged
	>1: increased saturation
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite = spr_whatever;
	shader = shd_gamma;
	u_gamma = shader_get_uniform(shader, "gamma");

Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f(u_gamma, 0.8);
		draw_sprite(sprite, 0, x, y);
	shader_reset();
*/




/*
** Contrast, saturation, brightness
** Code of this function is from TGM's shader pack
** http://irrlicht.sourceforge.net/phpBB2/viewtopic.php?t=21057
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

