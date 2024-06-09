extends Node

var save_data: SaveLoad = SaveLoad.new()

func _ready():
	save_data.load_score()

