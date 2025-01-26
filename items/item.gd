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


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	var player = $"/root/Main/Player"
	if effect < 0:
		player.reduce_life(-effect)
	else:
		player.increase_life(effect)
