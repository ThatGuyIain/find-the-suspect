extends CharacterBody2D

@export var speed: float = 200.0

const MINX = 0
const MINY = 0
const MAXX = 1800
const MAXY = 1000

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	input_vector = input_vector.normalized()
	
	if(global_position.x > MAXX):
		velocity.x = -speed
	elif(global_position.x < MINX):
		velocity.x = speed
	elif(global_position.y > MAXY):
		velocity.y = -speed
	elif(global_position.y < MINY):
		velocity.y = speed
	else:
		velocity = input_vector * speed

	move_and_slide()
