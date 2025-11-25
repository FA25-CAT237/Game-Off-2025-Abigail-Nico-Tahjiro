extends Sprite2D

var finalTutorial = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = load("res://Art/movetutorial.png")
	await get_tree().create_timer(3).timeout
	texture = load("res://Art/attacktutorial.png")
	finalTutorial = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GameHandler.getWaveNumber() != 0):
		queue_free()


func _on_tutorial_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group("attack") && finalTutorial == true):
		await get_tree().create_timer(1).timeout
		texture = load("res://Art/starttutorial.png")
