extends Node

var pipe_end := load("res://scenes/pipe_end.tscn")
var pipe := load("res://scenes/pipe.tscn")
var pipeline := load("res://scenes/pipeline.tscn")
var point := load("res://scenes/point.tscn")
const spawn := Vector2(1400, 720)
const pipe_height := 66;

@onready var timer = $KillPipeTimer
@onready var restart_timer = $RestartTimer
@onready var game_over_scene = load("res://scenes/game_over.tscn")

signal point_gained(score_gained)

var score = 0

func game_over():
	save_high_score()
	var game_over = game_over_scene.instantiate()
	add_child(game_over)
	game_over.set_score(score)
	
func _on_point_gained():
	score +=1
	point_gained.emit(score)
	
func generate_pipe():
	var node = pipeline.instantiate()
	node.position = spawn
	
	var height := randi_range(1,6)
	
	for i in range(height):
		var bottom_pipe = pipe.instantiate()
		bottom_pipe.position = Vector2(0, -pipe_height*i)
		node.add_child(bottom_pipe)
		
	var bottom_pipe_end = pipe_end.instantiate()
	bottom_pipe_end.position = Vector2(0, -pipe_height*height)
	node.add_child(bottom_pipe_end)
	
	var pointArea = point.instantiate()
	pointArea.position = Vector2(50, -pipe_height*(height+1))
	node.add_child(pointArea)
	pointArea.point_gained.connect(_on_point_gained)
	
	
	for i in range(height + 4, 15):
		var top_pipe = pipe.instantiate()
		top_pipe.rotation = deg_to_rad(180)
		top_pipe.position = Vector2(0, -pipe_height*i)
		top_pipe.ready
		node.add_child(top_pipe)
 

	var top_pipe_end = pipe_end.instantiate()
	top_pipe_end.position = Vector2(0, -pipe_height*height - pipe_height*3)
	top_pipe_end.rotation = deg_to_rad(180)
	node.add_child(top_pipe_end)
	
	add_child(node)
	
func _on_timer_timeout():
	generate_pipe()
	timer.wait_time = randf_range(1.0, 2.2)
	timer.start()
	
func save_high_score():
	var current_high_score = Global.save_data.high_score
	print(current_high_score)
	if score > current_high_score:
		Global.save_data.high_score = score
		Global.save_data.save()
