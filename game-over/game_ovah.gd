extends CanvasLayer

func _ready():
	$Score.text = "%d" % GlobalSceneManager.score

func _on_try_again_pressed() -> void:
	GlobalSceneManager.start_game()

func _on_back_menu_pressed() -> void:
	GlobalSceneManager.go_to_main_menu()
