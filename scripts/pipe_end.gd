extends StaticBody2D
@onready var sprite_2d = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func flip():
	sprite_2d.flip_h = true
