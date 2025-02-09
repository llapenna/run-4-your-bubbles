extends Area2D

@export var effect: float = 1.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var speed = $"/root/Main".speed
	position.x -= speed
	
	if (position.x < 0):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("chocado el tipo")
	var player = $"/root/Main/Player"
	if effect < 0:
		player.reduce_life(-effect)
	else:
		player.increase_life(effect)
