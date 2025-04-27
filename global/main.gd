extends Node

@onready var player = $Player

# Es necesario que sea static?
@export var acceleration: float
@export var initialSpeed: float
var speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = initialSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += acceleration * delta
	
	if (player.hp > 0):
		$UI/LifeBar.set_value(player.hp)
	
	if (player.hp <= 0):
		$UI/LifeBar.set_value(0)	
		GlobalSceneManager.end_game()


func _on_timer_timeout() -> void:
	$Player.affectBubbles(2.0, false)
