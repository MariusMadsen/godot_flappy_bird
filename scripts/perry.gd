extends CharacterBody2D


const JUMP_VELOCITY = -1200.0

var starting_y_pos: float
var top: float
var bottom: float

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var deadsound = $AudioStreamPlayer
@onready var collision_shape_2d = $CollisionShape2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 3000
var dead := false

func _physics_process(delta):
	 
	if is_on_wall() || is_on_floor():
		die()
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if !dead && Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		
	if velocity.y < 0:
		animated_sprite_2d.play("bird_flying")
	else:
		animated_sprite_2d.play("bird")
		
	var r_degrees = (position.y - starting_y_pos)/ bottom * 90
	rotation = deg_to_rad(r_degrees)

	move_and_slide()


func _on_ready():
	starting_y_pos = position.y
	top = starting_y_pos - 350
	bottom = starting_y_pos + 350
	collision_shape_2d.disabled = false

func die():
	if !dead:
		dead = true
		collision_shape_2d.disabled = true
		if deadsound.playing == false:
			deadsound.play()
