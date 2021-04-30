/*-----------------------------------------------------------------------------
Duotone Simple Shader v2: Simulate duotone processing like in Sepia toning
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This version uses the vertex colour to duotone.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
-
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

Create event:
---------------------------------------
	sprite		= spr_whatever;
	shader		= shd_duotone_simple;
	
Draw event:
---------------------------------------
	shader_set(shader);
		draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, $AAD4FF, 1);
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
    
    v_vTexcoord = in_TextureCoord;
	
	float grey = dot(in_Colour.rgb, vec3(0.299, 0.587, 0.114));
	
	v_vColour = vec4(in_Colour.rgb / grey, in_Colour.a);
}

