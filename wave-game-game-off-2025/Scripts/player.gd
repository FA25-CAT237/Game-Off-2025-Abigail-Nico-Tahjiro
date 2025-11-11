extends CharacterBody2D
# Shoutouts to Chris' Tutorials for player control help.
# https://www.youtube.com/watch?v=Luf2Kr5s3BM

@export var move_speed : float = 100

var attacking = false # so that you cant rapid-spam attacks
var healthCooldown = false # so that you dont lose health three times in the same second

var attackInstantiater

func _ready() -> void:
	attackInstantiater = preload("res://player_attack.tscn")

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
		# instantiate an attack
		var attackInstance = attackInstantiater.instantiate()
		$PlayerBody.add_child(attackInstance)
		await get_tree().create_timer(0.25).timeout
		attacking = false

# when hit, lose health
func loseHealth() -> void:
	if healthCooldown == false:
		healthCooldown = true
		print("owchy!") # replace later
		# make a better signifier of being temporarily invincible later
		await get_tree().create_timer(2).timeout
		healthCooldown = false
