/*-----------------------------------------------------------------------------
Contrast Shader: Changes the contrast of an image
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
As always with contrast: contrast also increases saturation.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
contrast float
	0:		all medium grey
	0 - 1:	reduced contrast
	1:		unchanged
	> 1:	increased contrast
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite = spr_whatever;
	shader = shd_contrast;
	u_contrast = shader_get_uniform(shader, "contrast");

Draw event:
---------------------------------------
	shader_set(shader);
		shader_set_uniform_f(u_contrast, 1.5);
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

