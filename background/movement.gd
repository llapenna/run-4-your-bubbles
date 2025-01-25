extends Node

signal on_background_entered
signal on_background_exited

@onready var sprite: Node2D = $"."
var factor = 1

func get_speed() -> float:
	var main = $"/root/Main"
	return main.speed if main else -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.position.x -= get_speed()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	on_background_entered.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	on_background_exited.emit()
