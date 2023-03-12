extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var sprite: AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	position.y = get_node("/root/PlayerVariables").y_position
	position.x = get_node("/root/PlayerVariables").x_position
	sprite  = get_node("Sprite")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move-left", "move-right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if position.x > 1150:
		get_node("/root/PlayerVariables").y_position = position.y
		get_node("/root/PlayerVariables").x_position = 0
		get_node("/root/PlayerVariables").curr_scene += 1
		get_tree().change_scene_to_file("res://Scene" + str(get_node("/root/PlayerVariables").curr_scene)+ ".tscn")
	if position.x < -1:
		get_node("/root/PlayerVariables").y_position = position.y
		get_node("/root/PlayerVariables").x_position = 1150
		get_node("/root/PlayerVariables").curr_scene -= 1
		get_tree().change_scene_to_file("res://Scene" + str(get_node("/root/PlayerVariables").curr_scene)+ ".tscn")
	if position.y > 1000:
		death()
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	if Input.is_action_just_pressed("shoot"):
		var projectile = preload("res://DogBullet.tscn")
		var instance = projectile.instantiate()
		get_parent().add_child(instance)

	move_and_slide()

func on_bullet_collision(body: Node2D):
	if "player" in body.get_groups():
		death()

func death():
	get_tree().change_scene_to_file("res://Scene1.tscn")
	PlayerVariables.curr_scene = 1
	PlayerVariables.x_position = 163
	PlayerVariables.y_position = 300
