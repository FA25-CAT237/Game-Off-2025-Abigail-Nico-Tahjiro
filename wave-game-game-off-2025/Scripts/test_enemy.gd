extends CharacterBody2D

@export var move_speed : float = 250 # how fast the enemy moves

@onready var player # reference to player character's position

var currentPosition : Vector2 #= self.position # reference to past currentPosition that will be updated periodically

var movementGate = false # to make movement on a clock that isn't physics process based
var colliderGate = false


func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	#self.global_position = get_parent().global_position # to make it spawn at the enemy spawner
	currentPosition = self.global_position

func _physics_process(delta: float) -> void:
	# lock movement gate and set current position if it's false
	if movementGate == false:
		movementGate = true
		currentPosition = self.global_position
	# move towards the player until a certain distance away from last currentPosition 
	if(global_position.distance_to(currentPosition) < 50):
		if global_position.distance_to(player.position) > 100:
			moveTowardsPlayer()
	else:
		await get_tree().create_timer(1).timeout
		movementGate = false
	
	# check for collision
	if $TestEnemyArea.get_overlapping_areas().size() > 0 && colliderGate == false:
		colliderGate = true
		checkCollision($TestEnemyArea.get_overlapping_areas())

# moveTowardsPlayer makes the enemy move towards the player
func moveTowardsPlayer() -> void:
	if(global_position.distance_to(currentPosition) < 50): 
		# update velocity and then move_and_slide
		velocity = global_position.direction_to(player.position) * move_speed
		move_and_slide()

# check if its contacting the player, the radio, or an attack
func checkCollision(collisions) -> void:
	var i = collisions.size()
	while i > 0:
		# check if it's the player
		if(collisions[i - 1].is_in_group("player")):
			player.loseHealth() # we already have a direct reference to the player
		# check if it's an attack from the player
		if(collisions[i - 1].is_in_group("attack")):
			print("dead enemy")
			queue_free() # die. could be improved upon later
		# add one for the radio too
		
		i = i - 1
	colliderGate = false

# move if clipping with another enemy
func _on_clipping_check_area_entered(area: Area2D) -> void:
	if(area.is_in_group("clippingcheck")):
		self.position.x = self.position.x + randi_range(-5, 5)
		self.position.y = self.position.y + randi_range(-5, 5)
