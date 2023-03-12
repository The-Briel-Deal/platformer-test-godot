extends Area2D


# Called when the node enters the scene tree for the first time.
var time_elapsed = 0
var disabled = false
func _ready():
	get_node("Sprite2D").modulate.a = 0.5
	get_node("Sprite2D2").modulate.a = 0.5
	get_node("CollisionShape2D").disabled = true
	get_node("CollisionShape2D").disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta)
	
	time_elapsed += delta
	
	if time_elapsed > 3:
		time_elapsed = 0
		
		if disabled:
			get_node("Sprite2D").modulate.a = 1
			get_node("Sprite2D2").modulate.a = 1
			get_node("CollisionShape2D").disabled = false
			get_node("CollisionShape2D2").disabled = false
			disabled = false
		else:
			get_node("Sprite2D").modulate.a = 0.5
			get_node("Sprite2D2").modulate.a = 0.5
			get_node("CollisionShape2D").disabled = true
			get_node("CollisionShape2D2").disabled = true
			disabled = true
	
