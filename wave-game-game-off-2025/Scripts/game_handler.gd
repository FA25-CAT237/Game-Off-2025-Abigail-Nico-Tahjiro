extends Node

# variable for what wave it is
var wave = 0

# function for starting a wave
func startWave() -> void:
	wave = wave + 1
	var i = 0
	while (i) < get_tree().get_nodes_in_group("spawner").size():
		get_tree().get_nodes_in_group("spawner")[i].spawnEnemies(wave * 2)
		i = i + 1
