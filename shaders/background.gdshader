shader_type canvas_item;

uniform vec2 tiling = vec2(1.0);
uniform vec2 offset = vec2(1.0);

void vertex() {
	UV = UV * tiling + offset * TIME*0.5;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

