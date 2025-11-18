extends Sprite2D

var healthCooldown = false

@onready var player # reference to player character's position


func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]

func _process(delta: float) -> void:
	if player.position.y > self.position.y:
		self.z_index = -1
	else:
		self.z_index = 2

# when hit, lose health
func loseHealth(damage) -> void:
	GameHandler.drainRadioHealth(damage)
