extends Area2D

var itemStrength = 20
var isGood: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print($CollisionShape2D.global_position)
	
	var speed = $"/root/Main".speed
	position.x -= speed

	if (global_position.x < (-1000)):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	#print("chocado el tipo: ", body.global_position, "collider: ", global_position)
	var player = $"/root/Main/Player"
	player.affectBubbles(itemStrength, isGood)


func _on_area_entered(area: Area2D) -> void:
	var player = $"/root/Main/Player"
	player.affectBubbles(itemStrength, isGood)
