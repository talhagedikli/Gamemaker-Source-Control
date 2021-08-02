//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 iResolution; 
uniform float time;
uniform vec3 color;

void main()
{
    vec4 base	= texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 blue	= vec3(0.2, 0.3, 0.5);
	vec3 col	= mix(base.xyz, vec3(0.), 0.8);
	gl_FragColor = v_vColour * vec4(col, base.a);
}
