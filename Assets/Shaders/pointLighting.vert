#version 440
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

out gl_PerVertex{
    vec4 gl_Position;
};

//Vertex Attributes
layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 uv;

//Instance Attributes
layout (location = 3) in mat4 modelMatrix;
layout (location = 7) in vec4 color;
layout (location = 8) in float radius;
layout (location = 9) in vec3 attenuation;

layout (location = 0) out vec4 out_clipPos;
layout (location = 1) out mat4 invViewProj;
layout (location = 5) out int  width;
layout (location = 6) out int  height;
layout (location = 7) out vec4 lightPos;
layout (location = 8) out float lightRadius;
layout (location = 9) out vec4 lightColor;
layout (location = 10) out vec3 lightAttenuation;

layout(push_constant) uniform Constants {
    mat4 proj;
    mat4 view;
    mat4 invViewProj;
    int width;
    int height;
} passConsts;

void main() 
{
    vec3 radPos = pos * radius;
    vec4 depthPos = vec4(radPos, 1);

    depthPos = modelMatrix * depthPos;
    depthPos = passConsts.view * depthPos;
    
    vec4 clipPos = passConsts.proj * depthPos;
    out_clipPos = clipPos;

    gl_Position = clipPos;

    invViewProj = passConsts.invViewProj;
    width = passConsts.width;
    height = passConsts.height;

    lightPos = modelMatrix[3];
    lightRadius = radius;
    lightColor = color;
    lightAttenuation = attenuation;

    // GL->VK conventions
    gl_Position.y = -gl_Position.y;
    //gl_Position.z = (gl_Position.z + gl_Position.w) / 2.0;
}
