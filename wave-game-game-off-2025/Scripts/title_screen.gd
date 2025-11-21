extends Node2D

# when start button is pressed, go to the main game
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://testing.tscn")
