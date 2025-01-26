extends Node

@export var effect: float = 1.1
@onready var node: Node2D = $"."

func movement():
	var speed = $"/root/Main".speed
	node.position.x -= speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()

func _on_visible_exited() -> void:
	$".".queue_free()

func _on_collided(body: Node) -> void:
	GlobalSceneManager.change_hp(effect)
