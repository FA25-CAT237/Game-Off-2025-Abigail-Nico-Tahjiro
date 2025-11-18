extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RadioHealthBar.texture = load("res://Art/RadioHealth100.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# change heart sprites to reflect player's health
	if(GameHandler.getRadioHealth() <= 75):
		$RadioHealthBar.texture = load("res://Art/RadioHealth75.png")
	if(GameHandler.getPlayerHealth() <= 50):
		$RadioHealthBar.texture = load("res://Art/RadioHealth50.png")
	if(GameHandler.getPlayerHealth() <= 25):
		$RadioHealthBar.texture = load("res://Art/RadioHealth25.png")
	if(GameHandler.getPlayerHealth() <= 0):
		$RadioHealthBar.texture = load("res://Art/RadioHealth0.png")
