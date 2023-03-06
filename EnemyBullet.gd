extends Area2D


# Called when the node enters the scene tree for the first time.
var position_to_move_to: Vector2 = Vector2()
var x_dist_to_move_per_frame: float
var y_dist_to_move_per_frame: float
var direction: Vector2 = Vector2()

func _ready():
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	direction = ( player.position - position ).normalized()
	connect("body_entered", player.on_bullet_collision)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction
