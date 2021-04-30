//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float texelSize;

void main()
{
    vec4 temp	= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 st		= gl_FragCoord.xy;
    temp		= temp * (mod(v_vTexcoord.y, texelSize*2.0) * 1.0/texelSize);
	//temp.rgb	*= vec3( 1. - smoothstep(15., 15.9, mod(st.x, 16.)) ); 
	
    gl_FragColor = temp;
}
