#version 450
/* 4) Shader description
The vertex shader is executed once for every vertex. It receives the positon and normal for each vertex as an input,
alongside with the worldViewProjection Matrix to transform the model from model space to world space, view space and
finally projection space.
In this implementation we have a single worldViewProjMatrix for a single model which is fine if there is only a single
instance of the model, if however we have multiple instances of the same model each of them requires their own
transformation matrix.
*/
uniform mat4 worldViewProjMatrix;

in vec4 sPos;
in vec3 sNormal;

out vec3 normal;

void main() {
    normal = sNormal;
    // no normalization of homogenous coords required as w is used internally by openGL
    gl_Position = worldViewProjMatrix * sPos;
}
