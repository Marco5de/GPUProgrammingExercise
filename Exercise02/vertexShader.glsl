#version 150

uniform mat4 worldViewProjMatrix;
uniform float time;

in vec4 sPos;
in vec3 sNormal;

out vec3 normal;


void main()
{
    const float amplitude = 0.1;
    const float freq = 10.0;
    float disp_y = amplitude * sin(freq * sPos.x + time);
    float derivative = amplitude * freq * cos(freq * sPos.x + time);
    float alpha = atan(derivative);

    mat4 disp_mat = mat4(1.0, 0.0, 0.0, 0.0,
                    0.0, 1.0, 0.0, 0.0,
                    0.0, 0.0, 1.0, 0.0,
                    0.0, disp_y, 0.0, 1.0);

    mat3 rot_z_alpha = mat3(cos(alpha), sin(alpha), 0.0,
                            -sin(alpha), cos(alpha), 0.0,
                            0.0, 0.0, 1.0);

    gl_Position = worldViewProjMatrix * disp_mat * sPos;
    normal = rot_z_alpha * sNormal;
}


