extends Node

signal on_background_entered
signal on_background_exited

var sprite: Node2D
var factor = 1

func get_speed() -> float:
	var main = $"/root/Main"
	return main.speed if main else -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("speed", get_speed())
	sprite.position.x -= get_speed()
