/*-----------------------------------------------------------------------------
Simple Fade Shader: Fades each pixel by the same alpha value
Fragment Shader: Multiply sample alpha with uniform alpha
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float alpha;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(base_col.rgb, base_col.a * alpha);
}
