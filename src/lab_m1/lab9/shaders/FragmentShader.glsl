#version 330

// Input
in vec2 texcoord;

// Uniform properties
uniform sampler2D texture_1;
uniform sampler2D texture_2;
uniform bool is_mix;
uniform bool is_time;
uniform float time;
uniform bool is_heightmap;


// Output
layout(location = 0) out vec4 out_color;

void main()
{
    // TODO(student): Calculate the out_color using the texture2D() function.
    vec4 color1 = texture(texture_1, texcoord); 
    vec4 color2 = texture(texture_2, texcoord);

    if (is_mix == true) {
        out_color = mix(color1, color2, 0.5f); 
    } else {
        out_color = color1;
    }

    if (is_time == true) {
        out_color = vec4(vec3(out_color.x + cos(time), out_color.y, out_color.z), 1.0);
    }

    if (out_color.a < 0.5f) {
        discard;
    }
    if (is_heightmap) {
        out_color = color1;
    }
}