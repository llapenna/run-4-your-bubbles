extends Node

var backgroundScene = preload("res://background/background.tscn")
@export var texture: CompressedTexture2D

@export var slowingFactor = .9
var speed = 1

func spawn_next():
	print_debug("Adding next")
	var last = get_sprites()[-1]
	
	if !last:
		return
	
	var instance: Sprite2D = backgroundScene.instantiate()
	$".".add_child(instance)
	
	instance.position.x += last.position.x + get_bg_length() / 2
	instance.texture = texture
	instance.connect("on_background_entered", Callable(self, "spawn_next"))
	

func remove_previous():
	var first = get_sprites()[0]
	
	if !first:
		return
	
	print_debug("Removing previous", first)
	first.queue_free()

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
	# Deberia añadir una primera copia del fondo al final
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var main = $"/root/Main"
	speed = (main.speed if main else 1) * slowingFactor


func _on_sprite_on_background_entered() -> void:
	spawn_next()


func _on_sprite_on_background_exited() -> void:
	remove_previous()
