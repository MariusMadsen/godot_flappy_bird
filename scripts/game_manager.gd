extends Node

var pipe_end := load("res://scenes/pipe_end.tscn")
var pipe := load("res://scenes/pipe.tscn")
var pipeline := load("res://scenes/pipeline.tscn")
var point := load("res://point.tscn")
const spawn := Vector2(5600, 2385)
@onready var timer = $KillPipeTimer
@onready var restart_timer = $RestartTimer
@onready var score_text = $Label
var score = 0
	
	
func _on_point_gained():
	score +=1
	score_text.text = str(score)
	
func generate_pipe():
	var node = pipeline.instantiate()
	node.position = spawn
	
	var height := randi_range(1,15)
	
	for i in range(height):
		var bottom_pipe = pipe.instantiate()
		bottom_pipe.scale = Vector2(3,3)
		bottom_pipe.position = Vector2(0, -100*i)
		node.add_child(bottom_pipe)
		
	var bottom_pipe_end = pipe_end.instantiate()
	bottom_pipe_end.scale = Vector2(3,3)
	bottom_pipe_end.position = Vector2(0, -100*height)
	node.add_child(bottom_pipe_end)
	
	var pointArea = point.instantiate()
	pointArea.position = Vector2(75, -100*(height))
	pointArea.scale = Vector2(10, 400)
	node.add_child(pointArea)
	pointArea.point_gained.connect(_on_point_gained)
	
	
	for i in range(height+8, 30):
		var top_pipe = pipe.instantiate()
		top_pipe.scale = Vector2(3,3)
		top_pipe.rotation = deg_to_rad(180)
		top_pipe.position = Vector2(0, -100*i)
		top_pipe.ready
		node.add_child(top_pipe)
 

	var top_pipe_end = pipe_end.instantiate()
	top_pipe_end.scale = Vector2(3,3)
	top_pipe_end.position = Vector2(0, -100*height-700)
	top_pipe_end.rotation = deg_to_rad(180)
	node.add_child(top_pipe_end)
	
		
	add_child(node)
	
func _on_timer_timeout():
	generate_pipe()
	timer.wait_time = randf_range(1.0, 2.2)
	timer.start()
