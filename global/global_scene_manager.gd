extends Node

var current_scene = null
var inputs_locked = false

const GAME_START_SCENE_PATH =  "res://global/main.tscn"
const GAME_OVER_SCENE_PATH = "res://game-over/game_ovah.tscn"
const MAIN_MENU_SCENE_PATH = "res://menu-ui/menu_ui.tscn"
const CREDITS_SCENE_PATH = "res://credits/credits.tscn"

var score = 0
var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func start_game():
	inputs_locked = false
	score = 0
	goto_scene(GAME_START_SCENE_PATH)

func end_game():
	inputs_locked = true
	await get_tree().create_timer(1).timeout
	goto_scene(GAME_OVER_SCENE_PATH)

func go_to_main_menu():
	goto_scene(MAIN_MENU_SCENE_PATH)
	
func show_credits():
	goto_scene(CREDITS_SCENE_PATH)

func quit_game():
	get_tree().quit()
	
# Effect should be a percentage value ranging from 0 to 2
func change_hp(effect: float):
	hp *= effect
	
func _deferred_goto_scene(path: String):
	current_scene.free()

	var s = ResourceLoader.load(path) as PackedScene

	current_scene = s.instantiate()
	
	get_tree().root.add_child(current_scene)
	
	get_tree().current_scene = current_scene
	

func _on_game_over():
	inputs_locked = false
