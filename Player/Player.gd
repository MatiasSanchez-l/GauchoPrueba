extends KinematicBody2D

const GRAVEDAD = 700
const VELOCIDAD = 200
const ARRIBA = Vector2(0,-1)

var salto = -350
var direccion = 1
var invulnerable = false

var movimiento = Vector2()

const PROYECTIL = preload("res://Player/Proyectil.tscn")

#variables para la camara
onready var cam = $Camera2D
onready var manejo_camara = $Manejo_camara

var spawn = position

func _ready():
	spawn = position
	add_to_group("Player")

func _physics_process(delta):
	movimiento.y += GRAVEDAD * delta
	
	if Input.is_action_pressed("ui_right"):
		movimiento.x = VELOCIDAD
		direccion = 1
		if(!$AnimationPlayer.is_playing()):
			$AnimationPlayer.play("Corriendo")
		$Cuerpo.scale.x = 1
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		movimiento.x = -VELOCIDAD
		direccion = -1
		if(!$AnimationPlayer.is_playing()):
			$AnimationPlayer.play("Corriendo")
		$Cuerpo.scale.x = -1
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		movimiento.x = 0
		if(!$AnimationPlayer.is_playing()):
			$AnimationPlayer.play("Idle")
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		movimiento.y = salto
	
	
	if Input.is_action_just_pressed("X"):
		$AnimationPlayer.play("ataque")
		if direccion == 1:
			$Cuerpo.scale.x = 1
		else:
			$Cuerpo.scale.x = -1
	
	
	if Input.is_action_just_pressed("Z"):
		var proyectil = PROYECTIL.instance()
		if sign($Position2D.position.x) == 1:
			proyectil.direccion_proyectil(1)
		else:
			proyectil.direccion_proyectil(-1)
		get_parent().add_child(proyectil)
		proyectil.position = $Position2D.global_position
	
	movimiento = move_and_slide(movimiento, ARRIBA)

	#for para la camara
	for area in manejo_camara.get_overlapping_areas():
		if(area.is_in_group("Camara_ajuste")):
			cam.limit_left = area.position.x
			cam.limit_right = area.position.x + 640 * area.scale.x
			cam.limit_top = area.position.y
			cam.limit_bottom = area.position.y + 360 * area.scale.y

func morirJugador():
	position = spawn
	

func _on_GolpeEspada_body_entered(body):
	if body.is_in_group("Enemigo"):
		body.vida -= 1

func _on_AreaCuerpo_body_entered(body):
	if body.is_in_group("Enemigo"):
		morirJugador()




func _on_Manejo_camara_body_entered(body):
	if body.is_in_group("Enemigo"):
		body.set_physics_process(true)


func _on_Manejo_camara_body_exited(body):
	if body.is_in_group("Enemigo"):
		body.set_physics_process(false)


func _on_Area2D_body_entered_inicializar_enemigo(body):
	if body.is_in_group("Enemigo"):
		body.set_physics_process(true)


func _on_Area2D_body_exited_finalizar_enemigo(body):
	if body.is_in_group("Enemigo"):
		body.set_physics_process(false)
