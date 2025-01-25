extends Node

var backgroundScene = preload("res://background/background.tscn")
var texture = Image.load_from_file("res://background/bg.jpg")

func spawn_next():
	var last = get_sprites()[-1]
	
	if !last:
		return
	
	var instance: Sprite2D = backgroundScene.instantiate()
	$".".add_child(instance)
	
	instance.position.x += last.position.x + get_bg_length()/2
	instance.connect("on_background_entered", Callable(self, "spawn_next"))
	

func remove_previous():
	var first = get_sprites()[0]
	
	if !first:
		return
	
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
	pass


func _on_sprite_on_background_entered() -> void:
	print("Needs new background")
	spawn_next()


func _on_sprite_on_background_exited() -> void:
	print("Remove background")
	remove_previous()
