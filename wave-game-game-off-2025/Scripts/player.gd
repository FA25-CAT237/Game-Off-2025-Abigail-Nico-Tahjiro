extends CharacterBody2D
# Shoutouts to Chris' Tutorials for player control help.
# https://www.youtube.com/watch?v=Luf2Kr5s3BM

@export var move_speed : float = 100

var attacking = false

func _ready() -> void:
	$PlayerBody/PlayerAttack.hide()

# movement
func _physics_process(delta: float) -> void:
	# Get the input direction
	var input_direction = Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		Input.get_action_strength("moveDown") - Input.get_action_strength("moveUp"))
	
	# Move sprite based on input direction
	if(Input.get_action_strength("moveRight") > Input.get_action_strength("moveLeft")):
		$PlayerBody.scale.x = 1
	else: if(Input.get_action_strength("moveRight") < Input.get_action_strength("moveLeft")):
		$PlayerBody.scale.x = -1
	
	# Update velocity
	velocity = input_direction * move_speed
	
	# Move and slide function moves character on map
	move_and_slide()

# when an attack is done, summon the attack hitbox
func attack() -> void:
	if attacking == false:
		attacking = true
		#unhide playerattack and then hide it again after a short timer
		$PlayerBody/PlayerAttack.show()
		await get_tree().create_timer(0.25).timeout
		$PlayerBody/PlayerAttack.hide()
		attacking = false
