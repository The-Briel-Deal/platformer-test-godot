extends Area2D

var moving_forward: bool


func _ready():
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	var enemys= get_tree().get_nodes_in_group("enemy")
	position.x = player.position.x
	position.y = player.position.y
	
	if player.get_node("Sprite").flip_h:
		moving_forward = false
	else:
		moving_forward = true
	
	for enemy in enemys:
		connect("area_entered", enemy.on_bullet_collision)
	var bark_file = FileAccess.open("res://Assets/Audio/VoiceLines/Bark.mp3", FileAccess.READ)
	var bark = AudioStreamPlayer.new()
	bark.stream = AudioStreamMP3.new()
	bark.stream.data = bark_file.get_buffer(bark_file.get_length())
	bark.autoplay = true
	get_parent().add_child(bark)


func _process(delta):
	if moving_forward:
		position.x += 1
	else:
		position.x -= 1
