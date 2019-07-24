extends KinematicBody2D

const GRAVEDAD = 700
const VELOCIDAD = 150
const ARRIBA = Vector2(0,-1)

var movimiento = Vector2()
var direccion = 1
var esta_muerto = false


func _ready():
	pass

func morir():
	esta_muerto = true
	movimiento = Vector2(0,0)
	$CollisionShape2D.call_deferred("set_disabled", true)
	$Timer.start()

func _physics_process(delta):
	if esta_muerto == false:
		movimiento.x = VELOCIDAD * direccion
		
		movimiento.y += GRAVEDAD * delta
		
		movimiento = move_and_slide(movimiento, ARRIBA)
		
	if is_on_wall():
		direccion = -direccion
		$DetectarSuelo.position.x *= -1
		
	if$DetectarSuelo.is_colliding() == false:
		direccion = -direccion
		$DetectarSuelo.position.x *= -1

func _on_Timer_timeout():
	queue_free()
