extends Node2D

func _ready() -> void:
	await get_tree().create_timer(0.25).timeout
	queue_free()


func _on_player_attack_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("enemy")):
		area.get_parent().queue_free()
