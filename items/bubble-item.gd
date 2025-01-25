extends Node

signal on_collision(sprite)
@export var bubbleEffect: int = 10

func movement():
	var sprite = $"."
	#var speed = $"/root/Main".speed
	sprite.position.x -= 1#speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()

func _on_item_exited() -> void:
	$".".queue_free()
