#version 120

const float PI = 3.1415927;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

// Attributes
attribute vec4 mc_Entity;

// Uniforms
uniform vec3 cameraPosition;
uniform float frameTimeCounter;
uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;

void main() {
	gl_Position = ftransform();
	vec4 position = gbufferModelViewInverse * gl_ModelViewMatrix * gl_Vertex;
	vec3 worldpos = position.xyz + cameraPosition;
	if (mc_Entity.x == 18 || mc_Entity.x == 18.1)
	{
		// Calculate wave
		float wave = 0.05*sin(2 * PI * (frameTimeCounter*0.7 + worldpos.x * 0.14 + worldpos.z * 0.07))
				+ 0.05*sin(2 * PI * (frameTimeCounter*0.5 + worldpos.x * 0.10 + worldpos.z * 0.20));
		position.y = wave * 0.5 + position.y;

	} else if (mc_Entity.x == 31)
	{
				// Calculate wave
		float wave = 0.005*cos(2 * PI * (frameTimeCounter*0.7 + worldpos.x * 0.14 + worldpos.z * 0.07))
				+ 0.02*cos(2 * PI * (frameTimeCounter*0.5 + worldpos.x * 0.10 + worldpos.z * 0.20));
		position.y = wave * 0.5 + position.y;
	}
	
	gl_Position = gl_ProjectionMatrix * gbufferModelView * position;
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;
}