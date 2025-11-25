extends Node2D

func _ready() -> void:
	$TitleBackground.play("default")

# when start button is pressed, go to the main game
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://testing.tscn")

func _on_credits_button_pressed() -> void:
	$Camera2D.position.y = 1500

func _on_back_button_pressed() -> void:
	$Camera2D.position.y = 0
