extends Node

signal on_collision(effect)

@onready var sprite: Sprite2D = $"."
@onready var effect = random_effect()
@export var bubbleEffect: int = 10

var effects = [
	{ "effect": 0.8, "resource":"res://assets/Arbustos/ar_1.png" },
	{ "effect": 0.8, "resource":"res://assets/Arbustos/ar_2.png" },
	{ "effect": 0.8, "resource":"res://assets/Arbustos/ar_3.png" },
	{ "effect": 0.8, "resource":"res://assets/Arbustos/ar_4.png" },
]

func random_effect():
	var rng = RandomNumberGenerator.new()
	var index = rng.randf_range(0, effects.size())
	
	return effects[index]

func movement():
	var speed = $"/root/Main".speed
	sprite.position.x -= speed

func _ready() -> void:
	var texture: CompressedTexture2D = load(effect.resource)
	sprite.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()

func _on_item_exited() -> void:
	$".".queue_free()
