//
// Simple passthrough fragment shader
/* non fixed
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4( vec3(Color.r+Color.g+Color.b)/3.0, Color.a);
}
*/
//fixed
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
    vec3 lum = vec3(0.299, 0.587, 0.114);
    gl_FragColor = vec4( vec3(dot( Color.rgb, lum)), Color.a);
}

/*
gm_BaseTexture = sprite in kendisi, texture, 2D
texture2D( sprite, position(0-1));
texture2D( gm_BaseTexture, vec2(0.5, 1)); //en alt ortadaki pixel
texture2D( gm_BaseTexture, v_vTexcoord); //default
*/