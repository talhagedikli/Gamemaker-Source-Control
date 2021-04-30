/*-----------------------------------------------------------------------------
Overlay Shader: Simulates Photoshops Overlay 
Vertex Shader: Pass-through
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
//varying vec4 v_vColour;

uniform vec3 col;

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	//VERSION 1: IF STATEMENT:
	/*float lum = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	
	if (lum > 0.5) {
		base_col.rgb = 1.0 - (1.0 - 2.0 * (base_col.rgb - 0.5)) * (1.0 - col);
	} else {
		base_col.rgb = (2.0 * base_col.rgb) * col;
	}
	
	gl_FragColor = base_col;
	*/
	
	//VERSION 2: ROUNDING LUMINANCE:
	/*float light = floor(0.5 + dot(base_col.rgb, vec3(0.299, 0.587, 0.114)));
	float dark  = 1.0 - light;
	
	base_col.rgb = light * (1.0 - (1.0 - 2.0 * (base_col.rgb - 0.5)) * (1.0 - col)) + dark * 2.0 * base_col.rgb * col;
	
	gl_FragColor = base_col;
	*/
	
	//VERSION 3: INLINE IF:
	float lum = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	base_col.rgb = lum > 0.5 ? 1.0 - (1.0 - 2.0 * (base_col.rgb - 0.5)) * (1.0 - col) : 2.0 * base_col.rgb * col;
	gl_FragColor = base_col;
}

/*(Target > 0.5) * (1 - (1-2*(Target-0.5)) * (1-Blend)) +
(Target <= 0.5) * ((2*Target) * Blend)*/
