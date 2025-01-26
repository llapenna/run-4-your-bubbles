extends Control

@onready var ScoreLabel = $"../Score/ScoreLabel"
@onready var HoursLabel = $"../Timer/Horas"
@onready var MinutesLabel = $"../Timer/Minutos"
@onready var SecondsLabel = $"../Timer/Segundos"

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var miliseconds: int= 0

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	GlobalSceneManager.score +=1
	ScoreLabel.text= "Score: %d" % GlobalSceneManager.score

	time +=delta
	miliseconds = fmod(time, 1) * 100
	seconds= fmod(time, 60)
	minutes= fmod(time,3600) / 60
	
	HoursLabel.text= "%02d:" % minutes
	MinutesLabel.text="%02d." % seconds
	SecondsLabel.text="%03d" % miliseconds
	
