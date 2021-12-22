extends KinematicBody2D

var motion = Vector2()
var speed = 500
var jump_height = 500
var extra_jump = 1
var jumps = 0

const GRAVITY = 20
const UP = Vector2(0, -1)

func Dash():
	speed = 700
	$Timer.start()
	
	
func _on_Timer_timeout():
	speed = 200



	
func _physics_process(delta):
	motion.y += GRAVITY

	if Input.is_action_pressed("right"):
		motion.x = speed
	elif Input.is_action_pressed("left"):
		motion.x = -speed
	else:
		motion.x = lerp(motion.x, 0, 0.2)
	
	if Input.is_action_just_pressed("jump") && jumps < extra_jump:
		motion.y = -jump_height
		jumps += 1
	
	if is_on_floor():
		jumps = 0
	
	if Input.is_action_pressed("dash"):
		Dash()
		
		
	motion = move_and_slide(motion, UP)

