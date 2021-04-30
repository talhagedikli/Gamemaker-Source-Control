/*-----------------------------------------------------------------------------
Invert Colour Shader: Inverts R, G & B but not A
Fragment Shader: Invert Colour: C = 1 - C
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col_base = texture2D( gm_BaseTexture, v_vTexcoord );
	
	col_base.rgb = 1.0 - col_base.rgb;
	
	gl_FragColor = v_vColour * col_base;
}

