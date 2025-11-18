extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HeartOne.texture = load("res://Art/fullheart placeholder.png")
	$HeartTwo.texture = load("res://Art/fullheart placeholder.png")
	$HeartThree.texture = load("res://Art/fullheart placeholder.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# change heart sprites to reflect player's health
	if(GameHandler.getPlayerHealth() < 3):
		$HeartThree.texture = load("res://Art/emptyheart placeholder.png")
	if(GameHandler.getPlayerHealth() < 2):
		$HeartTwo.texture = load("res://Art/emptyheart placeholder.png")
	if(GameHandler.getPlayerHealth() < 1):
		$HeartOne.texture = load("res://Art/emptyheart placeholder.png")
