//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float time;

void main()
{
	vec4 base_col	= texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 st			= v_vPosition;
	
	vec3 col_br		= vec3(0.6, 0.32, 0.22);
	//col_br			-= vec3( smoothstep(15., 15.9, mod(st.x, 16.)) ); 
	col_br.r		+= (1. - 2. * mod(st.x * cos(time/1008999.) + st.y * sin(time/999.), 16. + cos(time/1000.)) / 10. * abs(sin(time/10000.)) );
	col_br.g		-= (1. - 2. * mod(st.y * cos(time/1008999.) * st.x/ 16.+ st.x * sin(time/999.), 16. + cos(time/1000.)) / 10. * abs(sin(time/10000.)) ) - 0.5;
	
	
	base_col.rgb	= col_br;
	
    gl_FragColor = vec4(base_col.rgb, 1.);
}
