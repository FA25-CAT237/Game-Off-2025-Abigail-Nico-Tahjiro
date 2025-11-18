extends Node2D

# preload all the enemy types
var testEnemy
var testEnemy2

var enemySpawn

# for randomizing what enemy types get spawned
var rng = RandomNumberGenerator.new()
var enemySpawnChance

# for randomizing enemy spawn position
var basePosition

func _ready() -> void:
	# preload all the enemy types
	testEnemy = preload("res://test_enemy.tscn")
	testEnemy2 = preload("res://test_enemy_2.tscn")
	
	basePosition = self.position
	
	# for testing
	#spawnEnemies(3)

func spawnEnemies(howMany: int):
	for int in howMany:
		self.position.x = self.position.x + rng.randi_range(-5, 5)
		self.position.y = self.position.y + rng.randi_range(-5, 5)
		
		await get_tree().create_timer(rng.randf_range(0, 0.8)).timeout
		
		# generate a number for what enemy will be spawned
		enemySpawnChance = rng.randi_range(0, 100)
		# randomly choose which enemies to spawn based on the wave
		if enemySpawnChance <= 50:
			var enemySpawn = testEnemy.instantiate()
			add_child(enemySpawn)
		else:
			var enemySpawn = testEnemy2.instantiate()
			add_child(enemySpawn)
		self.position = basePosition
	pass
