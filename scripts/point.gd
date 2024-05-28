extends Area2D

signal point_gained

func _on_body_entered(body):
	if body.name == "Perry":
		print("swag")
		point_gained.emit()
		queue_free()
