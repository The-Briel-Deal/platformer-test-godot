extends Node2D


# Called when the node enters the scene tree for the first time.

var starting_health: int
func _ready():
	starting_health = get_tree().get_first_node_in_group("boss").hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var boss: StaticBody2D = get_tree().get_first_node_in_group("boss")
	if boss:
		get_node("RichTextLabel").text = str(boss.hp) + "/" + str(starting_health)
	else:
		get_node("RichTextLabel").text = "0/" + str(starting_health)
