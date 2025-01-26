extends Node2D

func init(value):
	$ProgressBar.value = value

func set_value(value) -> void:
	$ProgressBar.value = value
	
