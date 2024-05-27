extends Node2D

const SPEED := 1500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += SPEED *delta*-1
	if (position.x < -1400):
		queue_free()
