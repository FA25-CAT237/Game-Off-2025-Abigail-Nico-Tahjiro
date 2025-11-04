extends Node2D

# mouse position is divided by this in calculations.
# bigger numbers require more mouse movement to hit the edges
var handSpeed = 3

func _physics_process(delta: float) -> void:
	# rotate towards the cursor's x position within the designated limit
	rotation_degrees = (get_parent().get_local_mouse_position().x / handSpeed) - 90
	rotation_degrees = clamp(rotation_degrees, -160, -20)
