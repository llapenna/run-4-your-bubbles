extends Control

func _on_play_pressed() -> void:
	GlobalSceneManager.start_game()


func _on_quit_pressed() -> void:
	GlobalSceneManager.quit_game()
