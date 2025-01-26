extends Node2D
var bubblesScene = preload("res://bubbles-player/bubbles.tscn")
var bubbles = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bubbles = bubblesScene.instantiate()
	bubbles.init(Vector2($Player.position.x - 12, $Player.position.y + 20), 50, 40, 0.1)
	bubbles.pushBubbles(10)
	
	$".".add_child(bubbles)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	bubbles.popBubbles(5, 10)
	pass # Replace with function body.
