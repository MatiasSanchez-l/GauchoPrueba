extends KinematicBody2D

var velocidad = 200
var salto = -300
var arriba = Vector2(0,-1)
var gravedad = 700

var movimiento = Vector2()

const PROYECTIL = preload("res://Player/Proyectil.tscn")

#variables para la camara
onready var cam = $Camera2D
onready var manejo_camara = $Manejo_camara

func _ready():
	pass 

func _physics_process(delta):
	movimiento.y += gravedad * delta
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x = velocidad
		$Sprite.scale.x = 1
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		movimiento.x = -velocidad
		$Sprite.scale.x = -1
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		movimiento.x = 0
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		movimiento.y = salto
	
	if Input.is_action_just_pressed("X"):
		$AnimationPlayer.play_backwards("ataque")
	
	
	if Input.is_action_just_pressed("Z"):
		var proyectil = PROYECTIL.instance()
		if sign($Position2D.position.x) == 1:
			proyectil.direccion_proyectil(1)
		else:
			proyectil.direccion_proyectil(-1)
		get_parent().add_child(proyectil)
		proyectil.position = $Position2D.global_position
	
	movimiento = move_and_slide(movimiento, arriba)

	#for para la camara
	for area in manejo_camara.get_overlapping_areas():
		if(area.is_in_group("Camara_ajuste")):
			cam.limit_left = area.position.x
			cam.limit_right = area.position.x + 640 * area.scale.x
			cam.limit_top = area.position.y
			cam.limit_bottom = area.position.y + 360 * area.scale.y


func _on_GolpeEspada_area_entered(area):
	pass 
