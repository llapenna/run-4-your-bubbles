extends Node2D

var initial_position = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = initial_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init(parent_position):
	initial_position = parent_position
