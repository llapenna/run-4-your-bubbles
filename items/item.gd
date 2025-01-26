extends Node

@export var effect: float = 1.1
@onready var node: Node2D = $"."

func movement():
	var speed = $"/root/Main".speed
	node.position.x -= speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	node.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("collision")
