extends Node2D

var bubbleScene = preload("res://bubbles-player/single-bubble/Bubble.tscn")

var bubbles = []
var rangeX: Vector2
var rangeY: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _init(parentRangeX: Vector2, parentRangeY: Vector2):
	rangeX = parentRangeX
	rangeY = parentRangeY
	pass

func _pop(bubbleCount, timeToPopAll):
	for i in bubbleCount:
		await get_tree().create_timer(timeToPopAll/bubbleCount).timeout
		var bubbleToPop = bubbles.pop_front()
		$".".remove_child(bubbleToPop)
	pass

func _push(bubbleCount):
	for i in bubbleCount:
		var bubbleInstance = bubbleScene.instantiate()
		bubbleInstance.init(rangeX, rangeY)
		$".".add_child(bubbleInstance)
		bubbles.append(bubbleInstance)
	pass
