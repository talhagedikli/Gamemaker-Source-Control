/*-----------------------------------------------------------------------------
Duotone Stylized Shader: Simulate duotone process with a dark color and a light
color and crush the value range
Fragment Shader: calculate duotones
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 duo_col_light;
uniform vec3 duo_col_dark;
uniform float crush;

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	float grey = dot(base_col.rgb, vec3(0.299, 0.587, 0.114));
	grey = smoothstep(crush, 1.0 - crush, grey);
	
	vec3 out_col = mix(duo_col_dark, duo_col_light, grey);
	
	gl_FragColor = v_vColour * vec4(out_col, base_col.a);
}

