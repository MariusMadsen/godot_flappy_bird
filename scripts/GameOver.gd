extends Control

@onready var retry_button = $Panel/RetryButton
@onready var score = $Panel/Score
@onready var high_score = $Panel/HighScore

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_button_pressed():
	get_tree().reload_current_scene()

func set_score(score_gained):
	score.text = "SCORE: " + str(score_gained)
	high_score.text = "HIGHSCORE: " + str(Global.save_data.high_score)
