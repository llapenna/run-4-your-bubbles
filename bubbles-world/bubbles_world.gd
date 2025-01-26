extends Node2D

var bubblesScene = preload("res://bubbles-player/bubbles.tscn")
var bubblesCloud
const BUBBLES_COUNT = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bubblesCloud = bubblesScene.instantiate()
	bubblesCloud.init(Vector2(900, 500), 150, 150, 1)
	bubblesCloud.pushBubbles(BUBBLES_COUNT)
	$".".add_child(bubblesCloud)
	
	pass # Replace wiLth function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
