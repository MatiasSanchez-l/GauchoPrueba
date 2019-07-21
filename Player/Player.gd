extends KinematicBody2D

var velocidad = 200
var salto = -300
var arriba = Vector2(0,-1)
var gravedad = 700

var movimiento = Vector2()


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	movimiento.y += gravedad * delta
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x = velocidad
	elif Input.is_action_pressed("ui_left"):
		movimiento.x = -velocidad
	else:
		movimiento.x = 0
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		movimiento.y = salto
		
	movimiento = move_and_slide(movimiento, arriba)
