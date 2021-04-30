/*-----------------------------------------------------------------------------
Gamma Corrdection Shader: Changes the gamma of an imae
Fragment Shader: Calculate Color
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float gamma;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	base_col.rgb = pow(base_col.rgb, vec3(1.0 / gamma));
	gl_FragColor = base_col;
}

