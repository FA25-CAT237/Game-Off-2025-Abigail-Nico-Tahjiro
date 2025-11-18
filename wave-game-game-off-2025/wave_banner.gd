extends Node2D

func _ready() -> void:
	self.position = Vector2(-250, 0)

func _process(delta: float) -> void:
	
	
	GameHandler.startWave()
