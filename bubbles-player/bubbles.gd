extends Node2D

var bubbleScene = preload("res://bubbles-player/single-bubble/bubble.tscn")

var bubbles = []
var posOrigin
var posOffsetX: float = 0
var posOffsetY: float = 0
var bubbleScale = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func init(origin: Vector2, offsetX: float, offsetY: float, parentBubbleScale: float):
	posOrigin = origin
	posOffsetX = offsetX
	posOffsetY = offsetY
	bubbleScale = parentBubbleScale
	pass

func popBubbles(bubbleCount, timeToPopALl):
	for i in bubbleCount:
		var bubbleToPop = bubbles.pop_front()
		bubbleToPop.explode()
		await get_tree().create_timer(timeToPopALl/bubbleCount).timeout
		
		$".".remove_child(bubbleToPop)
	pass

func pushBubbles(bubbleCount):
	var bubblePoints = []
	
	for bubble in bubbles:
		bubblePoints.append(bubble.position)
	
	for i in bubbleCount:
		var bubbleInstance = bubbleScene.instantiate()

		var randPos = Vector2(
			randfn(posOrigin.x, posOffsetX), 
			randfn(posOrigin.y, posOffsetY)
		)
		
		var distance = randPos.distance_to(posOrigin)
		
		var randScaleNumber = 1*bubbleScale
		# var randScaleNumber = clamp(bubbleScale*expexpbubbleScale/(distance*distance), bubbleScale*0.15, bubbleScale)
		var randScale = Vector2(randScaleNumber, randScaleNumber)
		
		bubbleInstance.init(randPos, randScale)
		$".".add_child(bubbleInstance)
		bubbles.append(bubbleInstance)

func get_average_position(points):
	var sum: Vector2 = Vector2.ZERO
	if (points.size() == 0):
		return sum;

	for point in points:
		sum += point
	return sum / points.size()
