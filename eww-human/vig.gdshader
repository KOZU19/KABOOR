shader_type canvas_item;
uniform sampler2D screen_texture :hint_screen_texture, filter_linear;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec4 screen_color  =texture(screen_texture, uv);
	vec2 centered_uv = uv - vec2(0.5);
	float dist = length(centered_uv);
	float vignette = smoothstep(
		vignette_size * 0.5,
		vignette_size *0.5 - vignette_softness, dist
	);
	float darkness = (1.0 - vignette) *vignette_strength;
	screen_color.rgb *= (1.0  - darkness);
	COLOR = screen_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
