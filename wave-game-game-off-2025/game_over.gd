extends Node2D


func _on_retry_button_pressed() -> void:
	GameHandler.gameReset()
	get_tree().change_scene_to_file("res://testing.tscn")


func _on_title_button_pressed() -> void:
	GameHandler.gameReset()
	get_tree().change_scene_to_file("res://title_screen.tscn")
