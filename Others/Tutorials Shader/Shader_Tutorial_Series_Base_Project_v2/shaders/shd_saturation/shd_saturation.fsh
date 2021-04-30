/*-----------------------------------------------------------------------------
Saturation Shader: Changes the saturation of an image
Fragment Shader: Apply (de)saturation
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float saturation;

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float value = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	vec3 out_col = mix(vec3(value), base_col.rgb, saturation);

	gl_FragColor = v_vColour * vec4(out_col, base_col.a);
}

