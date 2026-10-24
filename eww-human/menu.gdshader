shader_type canvas_item;
uniform float scanline_strength  :hint_range(0.0, 0.5) = 0.12;
uniform float scanline_density :hint_range(100.0, 1200.0)= 500.0;
uniform float vignette_strength : hint_range(0.0, 1.0) = 0.35;
uniform float sweep_strength: hint_range(0.0, 1.0) = 0.8;
uniform float sweep_speed: hint_range(0.0, 2.0) = 0.2;
uniform sampler2D screen_texture:
	hint_screen_texture, repeat_disable, filter_linear;
void fragment() {
	vec2 uv = SCREEN_UV;
	vec4 scene = texture(screen_texture, uv);
	float scan = 0.5 +0.5 * sin(uv.y * scanline_density);
	float lines  =mix(1.0 - scanline_strength, 1.0, scan);
	vec2 centered =uv * 2.0 -1.0;
	float vignette = 1.0 - vignette_strength *
	smoothstep(0.25, 1.4, length(centered));
	float sweep_pos = fract(TIME*sweep_speed);
	float sweep  = exp(-pow((uv.y - sweep_pos) *30.0, 2.0));
	float light = 1.0 + sweep * sweep_strength;
	
	COLOR = vec4(
		scene.rgb * lines *vignette* light, scene.a
	);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
