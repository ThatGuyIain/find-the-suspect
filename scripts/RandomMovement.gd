extends CharacterBody2D

const MAXSPEED = 100
const MINX = 0 
const MAXX = 1800
const MINY = 0 
const MAXY = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = randf_range(-1,1) * MAXSPEED
	velocity.y = randf_range(-1,1) * MAXSPEED
	$Timer.start()


func _on_timer_timeout():
	velocity.x = randf_range(-1,1) * MAXSPEED
	velocity.y = randf_range(-1,1) * MAXSPEED
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(global_position.x > MAXX):
		velocity.x = -100
	if(global_position.x < MINX):
		velocity.x = 100
	if(global_position.y > MAXY):
		velocity.y = -100
	if(global_position.y < MINY):
		velocity.y = 100
	move_and_slide()
