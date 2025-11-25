extends Node2D

func _ready() -> void:
	self.position = Vector2(-2500, 0)
	if(GameHandler.getWaveNumber() + 1 == 1):
		$WaveBannerSprite.texture = load("res://Art/wave1banner.png")
	if(GameHandler.getWaveNumber() + 1 == 2):
		$WaveBannerSprite.texture = load("res://Art/wave2banner.png")
	if(GameHandler.getWaveNumber() + 1 == 3):
		$WaveBannerSprite.texture = load("res://Art/wave3banner.png")
	if(GameHandler.getWaveNumber() + 1 == 4):
		$WaveBannerSprite.texture = load("res://Art/wave4banner.png")
	if(GameHandler.gameIsOver == true):
		$WaveBannerSprite.texture = load("res://Art/gameoverbanner.png")
	if(GameHandler.getWaveNumber() + 1 >= 5):
		GameHandler.gameFinished()
	else:
		moveBy()

func moveBy() -> void:
	while(self.position.x < 0):
		self.position.x = self.position.x + 50
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(3).timeout
	while(self.position.x < 2500):
		self.position.x = self.position.x + 50
		await get_tree().create_timer(0.01).timeout
	if(GameHandler.gameIsOver == false):
		GameHandler.startWave()
	else:
		get_tree().change_scene_to_file("res://game_over.tscn") # change to actual game later
	queue_free()
