extends StaticBody2D

signal area_entered
signal laser_hit_something

# Called when the node enters the scene tree for the first time.
var hp: int = 50

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (hp <= 0):
		queue_free()
	
func on_bullet_collision(body: Node2D):
	var area2d = get_node("Area2D")
	if area2d.get_instance_id() == body.get_instance_id():
		hp -= 1

func _on_area_2d_area_entered(area):
	area_entered.emit()


func _on_lasers_body_entered(body):
	print(body)
	if (body.is_in_group("player")):
		body.queue_free()
