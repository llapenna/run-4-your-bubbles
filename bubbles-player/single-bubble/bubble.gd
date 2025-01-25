extends Node2D

var initial_position = Vector2(0, 0)
var initial_scale = Vector2(1, 1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = initial_position
	scale = initial_scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init(parent_position, parent_scale):
	initial_position = parent_position
	initial_scale = parent_scale
