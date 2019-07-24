extends Area2D

const VELOCIDAD = 300

var movimiento = Vector2()
var direccion = 1

func _physics_process(delta):
	movimiento.x = VELOCIDAD * delta * direccion
	translate(movimiento)
	
func direccion_proyectil(dir):
	direccion = dir


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Proyectil_body_entered(body):
	if body.is_in_group("Enemigo"):
		body.morir()
	queue_free()
