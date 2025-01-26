extends CanvasLayer

func _on_retry_pressed() -> void:
	GlobalSceneManager.start_game()

func _on_button_pressed() -> void:
	GlobalSceneManager.go_to_main_menu()
