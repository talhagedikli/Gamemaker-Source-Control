/*-----------------------------------------------------------------------------
Premutliply Alpha Shader: Multiplies each fragments alpha into it's color
Fragment Shader: Premultiply Alpha
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(col.rgb * col.a, col.a);
}


