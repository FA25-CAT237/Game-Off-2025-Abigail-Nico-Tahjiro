extends CharacterBody2D
# Shoutouts to Chris' Tutorials for player control help.
# https://www.youtube.com/watch?v=Luf2Kr5s3BM

@export var move_speed : float = 100

var attacking = false # so that you cant rapid-spam attacks
var healthCooldown = false # so that you dont lose health three times in the same second

var attackInstantiater

@onready var radio  # reference to radio's position
var touchingRadio = false

func _ready() -> void:
	attackInstantiater = preload("res://player_attack.tscn")
	radio = get_tree().get_nodes_in_group("radio")[0]
	
	# for testing
	GameHandler.startWave()

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
	
	if(Input.is_action_just_released("interact") && touchingRadio == true):
		print("this is where we'll make the next wave start if the last one ended")
	
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
		GameHandler.drainPlayerHealth() # replace later
		# make a better signifier of being temporarily invincible later
		await get_tree().create_timer(2).timeout
		healthCooldown = false

# for determining touching radio
func _on_player_hurtbox_area_entered(area: Area2D) -> void:
	if area.get_parent() == radio:
		touchingRadio = true 

func _on_player_hurtbox_area_exited(area: Area2D) -> void:
	if area.get_parent() == radio:
		touchingRadio = false 
