//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 new_col = base_col;
	vec3 dif = vec3(1.0 - base_col.rgb);
	
	new_col = vec4(base_col.rgb + dif, base_col.a);
	
    gl_FragColor = new_col;
}
