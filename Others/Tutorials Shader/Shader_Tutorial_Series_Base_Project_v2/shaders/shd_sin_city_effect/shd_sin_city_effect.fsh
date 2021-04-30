/*-----------------------------------------------------------------------------
Sin City Shader based on rgb: Desat everything except r, g or b
Fragment Shader: Partial desat

This shader is strongly based on a shader by TerrifyingCookie found on reddit:
https://www.reddit.com/r/gamedev/comments/271ljs/how_do_i_achieve_a_sin_city_look_using_a_hlsl/chwnbuw/
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float red_threshold_min;
uniform float red_threshold_range;
uniform float red_strength;
uniform float contrast;
uniform float brightness;

void main()
{
	vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
    
	// gamma 1
    //base_col.rgb = pow(base_col.rgb, vec3(0.45));
        
    // b & w conversion
    float grey = dot(base_col.rgb, vec3(0.333));
              
    // get threshold weight
    //float weight = smoothstep(0.1, 0.25, base_col.r - grey);
    float weight = smoothstep(red_threshold_min, red_threshold_min + red_threshold_range, base_col.r - grey);

    // increase contrast
    //grey = pow(grey * 1.1, 2.0);
	grey = (grey - 0.5 + brightness) * contrast + 0.5;
	
    // mix gre & red
    base_col.rgb = mix(vec3(grey), base_col.rgb * vec3(red_strength, 0.5, 0.5), weight);

    // reverse gamma 1
    //gl_FragColor = v_vColour * vec4(pow(base_col.rgb, vec3(2.2)), base_col.a);
    gl_FragColor = v_vColour * base_col;
}

/*sampler2D Texture0 : register(s0);
 
float4 main(float2 uv : TEXCOORD0) : COLOR
{

        float3 colorin, colorout;
        colorin = tex2D( Texture0 , uv.xy).rgb;
        //convert to linear space, probably not necessary since I totally destroy
        //the color space later anyway
        colorin = pow(colorin, .45f);
        
        //initialize the black&white color to the average color value,
        //not 100% correct but works decently
        float3 bwcolor = dot(colorin.rgb, 1.f.xxx) * 0.33333f;
              
        //calculate the weight of the red color. smoothstep is a function that
        //creates a quadratic interpolation between 0 and 1 using the first
        //arg as the min value, the second as max value and third as interpolation
        //value. Result is clamped to be [0, 1]
        //I just picked these constants because they looked decent in the image
        float weight = smoothstep(0.1f, 0.25f, colorin.r - bwcolor);

        //Mess with the color space of the b&w. Again, arbitrary constants
        bwcolor = pow(bwcolor * 1.1f, 2.f);
        //interpolate between black&white and red based on the weight
        colorout = lerp(bwcolor, colorin * float3(1.1f, 0.5f, 0.5f), weight);

         //pow: convert back to gamma space
        return pow(float4(colorout, 1.f), 2.2f);
}
*/
