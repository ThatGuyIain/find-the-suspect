extends StaticBody2D

enum {
	IDLE,
	WANDER
}

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

# Stop moving when target is at +/- tolerance
func atTargetPosition():
	return((targetPosition - global_position).length() < TOLERANCE)

func _physics_process(delta):
	match state:
		IDLE:
			state = WANDER
		WANDER:
			accelerateToPoint(target_position,ACCELERATION * delta)
			if atTargetPosition():
				state = IDLE
	
	velocity = move_and_slide
