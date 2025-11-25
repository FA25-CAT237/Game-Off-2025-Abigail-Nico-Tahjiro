extends CharacterBody2D

@onready var player # reference to player character's position
var playerPosition

var moveSpeed = 300

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	playerPosition = player.position
	
	await get_tree().create_timer(5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(playerPosition) * moveSpeed
	move_and_slide()

func _on_projectile_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("player")):
		player.loseHealth()
		queue_free()
