#version 120

uniform sampler2D gcolor;

varying vec2 texcoord;

// The offset controls how far the 'new' pixels are rendered away from the 'old' pixels
const float offset = 1.0 / 10001.0;  

void main() {
    vec3 col = texture2D(gcolor, texcoord).rgb;
    /*
    // Offsets
    vec2 offsets[9] = vec2[](
        vec2(-offset,  offset), // top-left
        vec2( 0.0f,    offset), // top-center
        vec2( offset,  offset), // top-right
        vec2(-offset,  0.0f),   // center-left
        vec2( 0.0f,    0.0f),   // center-center
        vec2( offset,  0.0f),   // center-right
        vec2(-offset, -offset), // bottom-left
        vec2( 0.0f,   -offset), // bottom-center
        vec2( offset, -offset)  // bottom-right    
    );

    // This is the outline image kernel
    // Links to learn more:
    // https://setosa.io/ev/image-kernels/,
    // https://learnopengl.com/Advanced-OpenGL/Framebuffers
    float kernel[9] = float[](
        -1, -1, -1,
        -1, 8, -1,
        -1, -1, -1
    );
    
    vec3 sampleTex[9];
    for(int i = 0; i < 9; i++)
    {
        sampleTex[i] = vec3(texture2D(gcolor, texcoord.st + offsets[i]));
    }
    vec3 col = vec3(0.0);
    for(int i = 0; i < 9; i++)
    {
        col += sampleTex[i] * kernel[i];
    }
    */
    /* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(col, 1.0); //gcolor
}