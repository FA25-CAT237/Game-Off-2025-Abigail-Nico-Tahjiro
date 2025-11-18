extends Sprite2D

var healthCooldown = false

# when hit, lose health
func loseHealth(damage) -> void:
	GameHandler.drainRadioHealth(damage)
