extends Control

func _on_exit_pressed() -> void:
	print("end")
	GlobalSceneManager.quit_game()

func _on_start_pressed() -> void:
	GlobalSceneManager.start_game()

func _on_credits_pressed() -> void:
	GlobalSceneManager.show_credits()
	pass
