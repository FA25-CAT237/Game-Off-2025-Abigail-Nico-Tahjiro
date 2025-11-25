extends Node

# variable for what wave it is
var wave = 0

# health variables
var playerHealth = 3
var radioHealth = 100

# variable for current enemy count
var enemyCount = 0

# game over
var gameIsOver = false

# function for starting a wave
func startWave() -> void:
	if(gameIsOver == false):
		wave = wave + 1
	if(wave == 5 && gameIsOver == false):
		gameFinished()
		return
	var i = 0
	while (i) < get_tree().get_nodes_in_group("spawner").size():
		get_tree().get_nodes_in_group("spawner")[i].spawnEnemies(round(wave * 1.5))
		i = i + 1
	enemyCount = get_tree().get_nodes_in_group("enemy").size()

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
	print(radioHealth)
	if radioHealth <= 0:
		gameOver()

# function for returning radio health
func getRadioHealth() -> int:
	return radioHealth

# function for game over
func gameOver() -> void:
	gameIsOver = true

# function for resetting game
func gameReset() -> void:
	wave = 0
	gameIsOver = false
	playerHealth = 3
	radioHealth = 100

# function for game won
func gameFinished() -> void:
	if(gameIsOver == false):
		get_tree().change_scene_to_file("res://game_won.tscn")

# function for setting and returning enemy count
func getEnemyCount() -> int:
	enemyCount = get_tree().get_nodes_in_group("enemy").size()
	return enemyCount

# function for getting wave number
func getWaveNumber() -> int:
	return wave
