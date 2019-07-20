extends KinematicBody2D

var speed = 200
var jump = -300
var up = Vector2(0,-1)
var gravity = 700

var motion = Vector2()


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += gravity * delta
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		motion.y = jump
		
	motion = move_and_slide(motion, up)
