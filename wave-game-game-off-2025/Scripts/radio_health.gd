extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RadioHealthBar.texture = load("res://Art/RadioHealth100.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# change sprite to reflect radio's health
	if(GameHandler.getRadioHealth() <= 75):
		$RadioHealthBar.texture = load("res://Art/RadioHealth100.png")
	if(GameHandler.getRadioHealth() <= 75):
		$RadioHealthBar.texture = load("res://Art/RadioHealth75.png")
	if(GameHandler.getRadioHealth() <= 50):
		$RadioHealthBar.texture = load("res://Art/RadioHealth50.png")
	if(GameHandler.getRadioHealth() <= 25):
		$RadioHealthBar.texture = load("res://Art/RadioHealth25.png")
	if(GameHandler.getRadioHealth() <= 0):
		$RadioHealthBar.texture = load("res://Art/RadioHealth0.png")
