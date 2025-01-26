extends Node

var backgroundScene = preload("res://background/background.tscn")
@export var texture: CompressedTexture2D

@export var slowingFactor: float
@export var resize: float
var speed = 1

func remove_sprite(sprite:Sprite2D):
	sprite.queue_free()

func spawn_next(sprite: Sprite2D):
	var instance: Sprite2D = backgroundScene.instantiate()
	$".".add_child(instance)
	
	instance.position.x += (sprite.position.x + get_bg_width())
	instance.texture = texture
	instance.connect("on_background_entered", Callable(self, "spawn_next"))
	instance.connect("on_background_exited", Callable(self, "remove_sprite"))

func get_bg_width() -> int:
	var width = texture.get_width()
	return width * resize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var main = $"/root/Main"
	speed = main.speed * slowingFactor


func _on_sprite_on_background_entered(sprite: Sprite2D) -> void:
	spawn_next(sprite)


func _on_sprite_on_background_exited(sprite: Sprite2D) -> void:
	remove_sprite(sprite)
