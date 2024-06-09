extends Control

@onready var label = $Label

func _ready():
	label.text = "SCORE: 0"

func setScore(score):
	label.text = "SCORE: " + str(score)
