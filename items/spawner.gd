extends Node

var arbusto_1_item = preload("res://items/arbusto_1.tscn")
var arbusto_2_item = preload("res://items/arbusto_2.tscn")
var arbusto_3_item = preload("res://items/arbusto_3.tscn")
var arbusto_4_item = preload("res://items/arbusto_4.tscn")

var item_list = [
	preload("res://items/arbusto_1.tscn"),
	preload("res://items/arbusto_2.tscn"),
	preload("res://items/arbusto_3.tscn"),
	preload("res://items/arbusto_4.tscn")
]

@export var minimumTime = 2 * 1000 # 2 seconds
@export var maximumTime = 5 * 1000 # 5 seconds
var elapsed_time = 0

func get_random_time():
	var rng = RandomNumberGenerator.new()
	return rng.randf_range(minimumTime, maximumTime)

# Initialize the variable to spawn next item
var trigger_time = get_random_time()

func pick_random_instance():
	var rng = RandomNumberGenerator.new()
	var index = rng.randf_range(0, item_list.size())
	
	return item_list[index]

func spawn():
	var instance: Node2D = pick_random_instance().instantiate()
	instance.position.y = 0
	$".".add_child(instance)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta * 1000
	if (elapsed_time >= trigger_time):
		spawn()
		
		# Reset timer
		elapsed_time = 0
		trigger_time = get_random_time()
