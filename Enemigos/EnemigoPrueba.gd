extends Node
class_name Enemigo

const GRAVEDAD = 750

var vida_max = 2
var velocidad = 75
var salto = 250

var movimientoDir = 1
var moviemiento = Vector2()
var vida = 2

var casa = position

func _ready():
	add_to_group("Enemigo")
	casa = position
	set_collision_layer_bit(0,0)
	set_collision_layer_bit(1,1)
	set_collision_mask_bit(0,0)
	set_collision_mask_bit(1,1)
	inicializar()

func inicializar():
	vida = vida_max
	movimientoDir = 1
	movimiento = Vector2()
	posicion = casa
	show()
	inicializar_extra()

func inicializar_extra():
	pass

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
	movimiento.y += gravedad * get_physics_process_delta_time()

func jump():
	movimiento.y = salto


func morir():
	print(srt(nombre, "murio"))
	vida = vida_max
	ocultar()
