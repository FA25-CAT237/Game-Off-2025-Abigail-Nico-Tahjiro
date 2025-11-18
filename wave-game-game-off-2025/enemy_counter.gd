extends Control

func _process(delta: float) -> void:
	$EnemyCountLabel.text = ("Enemy Count: " + str(GameHandler.getEnemyCount()))
