extends Node2D

@onready var hud = $HUD
@onready var game_manager = $GameManager

func _on_game_manager_point_gained(score):
	hud.setScore(score)


func _on_perry_died():
	game_manager.game_over()
