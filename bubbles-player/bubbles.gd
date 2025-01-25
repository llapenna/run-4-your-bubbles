extends Node2D

var bubbleScene = preload("res://bubbles-player/single-bubble/Bubble.tscn")

var averagePosition = Vector2(0, 0)
var bubbles = []
var rangeX
var rangeY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("print")
	init([0, 600], [0, 1200])
	_push(10)
	$Timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func init(parentRangeX: Array, parentRangeY: Array):
	rangeX = parentRangeX
	rangeY = parentRangeY
	pass

func _pop(bubbleCount, timeToPopALl):
	for i in bubbleCount:
		await get_tree().create_timer(timeToPopALl/bubbleCount).timeout
		var bubbleToPop = bubbles.pop_front()
		$".".remove_child(bubbleToPop)
	pass

func _push(bubbleCount):
	var averagePosition = get_average_position(bubbles.map(b => b.position))
	for i in bubbleCount:
		var bubbleInstance = bubbleScene.instantiate()
		
		var randPos = Vector2(randi_range(rangeX[0], rangeX[1]), randi_range(rangeY[0], rangeY[1]))
		var randScaleNumber = randi_range(0.2, 2.5)
		var randScale = Vector2(randScaleNumber, randScaleNumber)
		
		bubbleInstance.init(randPos, randScale)
		$".".add_child(bubbleInstance)
		bubbles.append(bubbleInstance)
	pass

func get_average_position(points):
	var sum: Vector2 = Vector2.ZERO
	for point in points:
		sum += point
	return sum / points.size()

func _on_timer_timeout() -> void:
	print("timeout")
	_pop(5, 5)
	pass # Replace with function body.
