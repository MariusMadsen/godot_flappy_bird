class_name SaveLoad extends Node

var high_score := 0

const SAVE_PATH := "user://high_score.save"

func _ready():
	load_score()

func save():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE_READ)
	file.store_32(high_score)

func load_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if (FileAccess.file_exists(SAVE_PATH)):
		high_score = file.get_32()
