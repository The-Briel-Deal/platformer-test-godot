extends Area2D


# Called when the node enters the scene tree for the first time.
var position_to_move_to: Vector2 = Vector2()
var x_dist_to_move_per_frame: float
var y_dist_to_move_per_frame: float

func _ready():
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	position_to_move_to.x = player.position.x
	position_to_move_to.y = player.position.y
	var x_dist_to_move = position_to_move_to.x - position.x
	var y_dist_to_move = position_to_move_to.y - position.y
	x_dist_to_move_per_frame = x_dist_to_move
	y_dist_to_move_per_frame = y_dist_to_move

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += x_dist_to_move_per_frame*delta
	position.y += y_dist_to_move_per_frame*delta
