extends Area2D

var time_elapsed_since_last_shoot: float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed_since_last_shoot += delta
	if time_elapsed_since_last_shoot > 1:
		time_elapsed_since_last_shoot = 0
		var projectile = preload("res://EnemyBullet.tscn")
		var instance = projectile.instantiate()
		instance.position.x = position.x
		instance.position.y = position.y
		get_parent().add_child(instance)
		
func on_bullet_collision(body: Node2D):
	if get_instance_id() == body.get_instance_id():
		queue_free()
