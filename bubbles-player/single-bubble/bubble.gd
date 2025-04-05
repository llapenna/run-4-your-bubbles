extends Node2D

var initial_position = Vector2(0, 0)
var initial_scale = Vector2(0.2, 0.2)

var bubbleSounds: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("static")
	
	bubbleSounds = [
		$Sounds/AudioStreamPlayer2D,
		$Sounds/AudioStreamPlayer2D2,
		$Sounds/AudioStreamPlayer2D3,
		$Sounds/AudioStreamPlayer2D4,
		$Sounds/AudioStreamPlayer2D5,
		$Sounds/AudioStreamPlayer2D6,
	]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init(parent_position, parent_scale):
	position = parent_position
	scale = initial_scale * parent_scale

func explode():
	$AnimatedSprite2D.play("explode")
	bubbleSounds.pick_random().play()
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.name == "explode":
		queue_free()
