extends Area2D

var moving_forward: bool


func _ready():
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	
	position.x = 100
	position.y = 100
	
	if player.get_node("Sprite").flip_h:
		moving_forward = false
	else:
		moving_forward = true

func _process(delta):
	if moving_forward:
		position.x += 1
	else:
		position.x -= 1
