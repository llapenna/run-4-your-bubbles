extends Node2D

var initial_position = Vector2(0, 0)
var initial_scale = Vector2(0.005, 0.005)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init(parent_position, parent_scale):
	position = parent_position
	scale = parent_scale

func explode():
	$Area2D/AnimatedSprite2D.play("default")
