#version 450
/* 4) Shader description
The pixel shader is executed once for every pixel, it receives the normal for each pixel, the light direction and the
input color. The latter remain constant for the entire model.
The lighting is computed in screen space by considering the angle between the light direction and the normal of the
considered pixel, this corresponds to the cos(angle) between them due to the normed dot product between the two vectors.
This is multiplied by the input color. Note that for the computation of the normals the linear interpolation of the
vertex normals is required which might create undesired effects in the interpolated normals.
*/

uniform vec3 lightDirection;
uniform vec4 inColor;

in vec3 normal;

out vec4 outColor;

void main() {
    outColor = dot(lightDirection, normal) * inColor;
}



