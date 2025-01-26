extends Timer




func _on_timeout() -> void:
	if $ProgressBar.value > 0:
		$ProgressBar.value -=1
