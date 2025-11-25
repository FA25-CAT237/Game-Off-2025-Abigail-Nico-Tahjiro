extends CharacterBody2D

@onready var player # reference to player character's position
var directionToPlayer

var moveSpeed = 400

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	directionToPlayer = global_position.direction_to(player.position)
	
	await get_tree().create_timer(5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	velocity = directionToPlayer * moveSpeed
	move_and_slide()
	if(GameHandler.gameIsOver == true):
		queue_free()

func _on_projectile_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("player")):
		player.loseHealth()
		queue_free()
