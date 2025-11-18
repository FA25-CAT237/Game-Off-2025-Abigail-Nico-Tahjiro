extends Sprite2D

var healthCooldown = false

# when hit, lose health
func loseHealth(damage) -> void:
	if healthCooldown == false:
		healthCooldown = true
		GameHandler.drainRadioHealth(damage)
		# make a better signifier of being temporarily invincible later
		await get_tree().create_timer(1).timeout
		healthCooldown = false
