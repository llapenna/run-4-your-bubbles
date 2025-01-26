extends Node

signal on_background_entered(sprite)
signal on_background_exited(sprite)

@onready var sprite: Node2D = $"."
@onready var screenDetector: VisibleOnScreenNotifier2D = $"./VisibleOnScreenNotifier2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = get_parent().texture
	var resize = get_parent().resize

	sprite.texture = texture
	sprite.scale = Vector2(resize, resize)

	# No need to apply resize here because screenDetector is already scaled by being
	# child of Sprite2D
	var length = texture.get_width()
	screenDetector.rect = Rect2(-length / 2, 0, length, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.position.x -= get_parent().speed


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	print("spawn next")
	on_background_entered.emit(self)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	on_background_exited.emit(self)
