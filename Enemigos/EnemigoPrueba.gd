extends KinematicBody2D
class_name Enemigo

const GRAVEDAD = 700
const ARRIBA = Vector2(0,-1)

var vida_max = 2
var velocidad = 100
var salto = -450

var movimientoDir = 1
var movimiento = Vector2()
var vida = 2

var spawn = position
#var esta_muerto = false

func _ready():
	add_to_group("Enemigo")
	spawn = position
	#set_collision_layer_bit(0,0)
	#set_collision_layer_bit(1,1)
	#set_collision_mask_bit(0,0)
	#set_collision_mask_bit(1,1)
	inicializar()

func inicializar():
	vida = vida_max
	movimientoDir = 1
	movimiento = Vector2()
	position = spawn
	#show()
	#inicializar_extra()

#func inicializar_extra():
#	pass

func vida():
	if vida <= 0:
		morir()

func aplicar_movimiento():
	movimiento = move_and_slide(movimiento, ARRIBA)

func movimiento_horizontal():
	movimiento.x = movimientoDir * velocidad

func movimiento_vertical():
	movimiento.y = movimientoDir * velocidad

func gravedad():
	movimiento.y += GRAVEDAD * get_physics_process_delta_time()

func saltar():
	movimiento.y = salto

func dar_vuelta():
	movimientoDir = -movimientoDir
	position.x += movimientoDir * 2

func volver_al_lugar():
	print("heeheee")
	position = spawn

func morir():
	#movimiento = Vector2(0,0)
	$CollisionShape2D.call_deferred("set_disabled", true)
	$TimerMuerte.start()
	#print(str(name, "murio"))
	#vida = vida_max
	#hide()
