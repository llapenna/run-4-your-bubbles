extends Control

var Score=0
@onready var ScoreLabel= $Panel/Score








func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Score +=1
	ScoreLabel.text= "Score: %d" % Score
