extends Node

# variable for what wave it is
var wave = 0

# health variables
var playerHealth = 3
var radioHealth = 100

# function for starting a wave
func startWave() -> void:
	wave = wave + 1
	var i = 0
	while (i) < get_tree().get_nodes_in_group("spawner").size():
		get_tree().get_nodes_in_group("spawner")[i].spawnEnemies(wave * 2)
		i = i + 1

# function for ticking down player health
func drainPlayerHealth() -> void:
	playerHealth = playerHealth - 1
	if playerHealth <= 0:
		gameOver()

# function for returning player health
func getPlayerHealth() -> int:
	return playerHealth

# function for ticking down radio health based on a given number
func drainRadioHealth(healthToDrain: int) -> void:
	radioHealth = radioHealth - healthToDrain
	if radioHealth <= 0:
		gameOver()

# function for returning radio health
func getRadioHealth() -> int:
	return radioHealth

# function for game over
func gameOver() -> void:
	print("oooohhhh you lost") # replace later
