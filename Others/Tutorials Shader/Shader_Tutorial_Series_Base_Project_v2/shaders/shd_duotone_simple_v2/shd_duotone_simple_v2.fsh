/*-----------------------------------------------------------------------------
Duotone Simple Shader v2: Simulate duotone processing like in Sepia toning
Fragment Shader: calculate duotones based on vertex colour
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	float grey = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	gl_FragColor = v_vColour * vec4(vec3(grey), base_col.a);
}

