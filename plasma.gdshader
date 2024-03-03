shader_type spatial;
render_mode cull_disabled, blend_mix;

float rand(float x) {
	return fract(sin(x) * 100000.0);
}

void vertex() {
	float tr = floor(floor(mod(TIME * 100.0, 100.0)) / 8.0);
	VERTEX.x += rand(VERTEX.y + tr) * 0.25;
	VERTEX.z += rand(VERTEX.x + tr) * 0.25;
	VERTEX.y += rand(VERTEX.x) * 0.15;
}

void fragment() {
	// Called for every pixel the material is visible on.
	ALPHA = 0.5;
	ALBEDO = vec3(0.0, 0.0, 0.0);
	EMISSION = vec3(0.0, 0.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
