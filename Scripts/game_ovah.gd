extends CanvasLayer





func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu principal.tscn")


func _on_button_pressed() -> void:
	get_tree().quit()
