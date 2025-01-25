extends Node

signal on_background_entered(sprite)
signal on_background_exited(sprite)

@onready var sprite: Node2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = get_parent().texture
	$".".texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = $"/root/Main".speed * $"..".slowingFactor
	sprite.position.x -= speed


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	on_background_entered.emit(self)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	on_background_exited.emit(self)
