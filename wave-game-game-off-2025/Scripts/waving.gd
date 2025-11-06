extends Sprite2D

# turns left when hits left; right when hits right; neutral when a wave is done
var currentDirection = "neutral"

func _on_wave_left_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hand"):
		if currentDirection == "neutral":
			# set it to left
			currentDirection = "left"
		if currentDirection == "right":
			# wave successfully done
			$WaveDing.play()
			currentDirection = "neutral"

func _on_wave_right_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Hand"):
		if currentDirection == "neutral":
			# set it to right
			currentDirection = "right"
		if currentDirection == "left":
			# wave successfully done
			$WaveDing.play()
			currentDirection = "neutral"
			$"../..".attack()
