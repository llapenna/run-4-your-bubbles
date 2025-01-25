extends Node

var backgroundScene = preload("res://background/background.tscn")
@export var texture: CompressedTexture2D

@export var slowingFactor = .9

func remove_sprite(sprite:Sprite2D):
	sprite.queue_free()

func spawn_next(sprite: Sprite2D):
	var instance: Sprite2D = backgroundScene.instantiate()
	$".".add_child(instance)
	
	instance.position.x += sprite.position.x + get_bg_length() / 2
	instance.texture = texture
	instance.connect("on_background_entered", Callable(self, "spawn_next"))
	instance.connect("on_background_exited", Callable(self, "remove_sprite"))

func get_bg_length() -> int:
	return texture.get_width()
func get_sprites() -> Array[Sprite2D]:
	var sprites: Array[Sprite2D] = []
	for child in get_children():
		if child.is_class("Sprite2D"):
			sprites.push_back(child)
	
	return sprites

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_sprite_on_background_entered(sprite: Sprite2D) -> void:
	spawn_next(sprite)


func _on_sprite_on_background_exited(sprite: Sprite2D) -> void:
	remove_sprite(sprite)
