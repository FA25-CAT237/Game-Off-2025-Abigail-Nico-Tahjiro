extends CharacterBody2D
# Shoutouts to Chris' Tutorials for player control help.
# https://www.youtube.com/watch?v=Luf2Kr5s3BM

@export var move_speed : float = 100


func _physics_process(delta: float) -> void:
	# Get the input direction
	var input_direction = Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown") - Input.get_action_strength("moveUp"))
	
	# Update velocity
	velocity = input_direction * move_speed
	
	# Move and slide function moves character on map
	move_and_slide()
