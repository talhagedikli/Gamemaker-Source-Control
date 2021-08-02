uniform vec3 iResolution; 
varying vec2 fragCoord; 
uniform float time;

// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

// Return random noise in the range [0.0, 1.0], as a function of x.
float Noise2d( in vec2 x )
{
    float xhash = cos( x.x * 37.0 );
    float yhash = cos( x.y * 57.0 );
    return fract( 415.92653 * ( xhash + yhash ) );
}

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

// Convert Noise2d() into a "star field" by stomping everthing below fThreshhold to zero.
float NoisyStarField( in vec2 vSamplePos, float fThreshhold )
{
    float StarVal = Noise2d( vSamplePos );
    if ( StarVal >= fThreshhold )
        StarVal = pow(abs( (StarVal - fThreshhold)/(1.0 - fThreshhold)), 6.0 );
    else
        StarVal = 0.0;
    return StarVal;
}

// Stabilize NoisyStarField() by only sampling at integer values.
float StableStarField( in vec2 vSamplePos, float fThreshhold )
{
    // Linear interpolation between four samples.
    // Note: This approach has some visual artifacts.
    // There must be a better way to "anti alias" the star field.
    float fractX = fract( vSamplePos.x );
    float fractY = fract( vSamplePos.y );
    vec2 floorSample = floor( vSamplePos );    
    float v1 = NoisyStarField( floorSample, fThreshhold );
    float v2 = NoisyStarField( floorSample + vec2( 0.0, 1.0 ), fThreshhold );
    float v3 = NoisyStarField( floorSample + vec2( 1.0, 0.0 ), fThreshhold );
    float v4 = NoisyStarField( floorSample + vec2( 1.0, 1.0 ), fThreshhold );

    float StarVal =   v1 * ( 1.0 - fractX ) * ( 1.0 - fractY )
        			+ v2 * ( 1.0 - fractX ) * fractY
        			+ v3 * fractX * ( 1.0 - fractY )
        			+ v4 * fractX * fractY;
	return StarVal;
}

void main( void )
{
	// Sky Background Color
	vec2 st = fragCoord.xy / iResolution.xy;
	vec3 blue = vec3(0.2, 0.3, 0.5);
	vec3 black = vec3(0.);
	float stpy = smoothstep(0.4, 1.6, st.y);
	//float stpx = smoothstep(0.4, 0.7, mod(st.x * 10., 3.) / 4.) * 0.3;
	
	vec3 vColor = mix( black, blue, vec3(stpy) );
	//vColor		= mix(vColor, blue, stpx);
    //// Note: Choose fThreshhold in the range [0.99, 0.9999].
    //// Higher values (i.e., closer to one) yield a sparser starfield.
    //float StarFieldThreshhold = 0.999;

    //// Stars with a slow crawl.
    //float xRate = 0.2;
    //float yRate = -0.06;
    //vec2 vSamplePos = fragCoord.xy + vec2( xRate * time , yRate * time );
	//float StarVal = StableStarField( vSamplePos, StarFieldThreshhold );
    //vColor += vec3( StarVal );
	
	gl_FragColor = vec4(vColor, 1.0);
}

