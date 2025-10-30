extends CharacterBody2D

enum {
	IDLE,
	WANDER
}

# Godot does not like me doing this but I have no idea as to why
var velocity = Vector2.ZERO
var state = IDLE

const ACCELERATION = 100
const MAX_SPEED = 50
const TOLERANCE = 4.0

@onready var startPosition = global_position
@onready var targetPosition = global_position

func updateTargetPosition():
	var targetVector = Vector2(randf_range(-32,32),randf_range(-32,32))
	targetPosition = startPosition + targetVector
	return(targetPosition)

# Stop moving when target is at +/- tolerance
func atTargetPosition():
	return((targetPosition - global_position).length() < TOLERANCE)

func _physics_process(delta):
	match state:
		IDLE:
			state = WANDER
			updateTargetPosition()
		WANDER:
			accelerateToPoint(targetPosition,ACCELERATION * delta)
			if atTargetPosition():
				state = IDLE
	
	velocity = move_and_slide()

func accelerateToPoint(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
	accelerate(acceleration_vector)

func accelerate(acceleration_vector):
	velocity += acceleration_vector
	velocity = velocity.clamped(MAX_SPEED)
