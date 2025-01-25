extends Node

var bubble_item = preload("res://items/bubble-item.tscn")
@export var minimumTime = 2 * 1000 # 2 seconds
@export var maximumTime = 5 * 1000 # 5 seconds
var elapsed_time = 0

func get_random_time():
	var rng = RandomNumberGenerator.new()
	return rng.randf_range(minimumTime, maximumTime)
	
var trigger_time = get_random_time()

func spawn():
	var instance: Sprite2D = bubble_item.instantiate()
	$".".add_child(instance)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta * 1000
	print(elapsed_time, ">=", trigger_time)
	if (elapsed_time >= trigger_time):
		print("spawn!")
		spawn()
		
		# Reset timer
		elapsed_time = 0
		trigger_time = get_random_time()
		
	
