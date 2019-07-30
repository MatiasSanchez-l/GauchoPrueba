extends Enemigo

var salio_de_camara = false

func _physics_process(delta):
	movimiento_horizontal()
	gravedad()
	vida()

	if is_on_wall() || $DetectarSuelo.is_colliding() == false || salio_de_camara:
		movimientoDir = -movimientoDir
		position.x += movimientoDir * 2
		$DetectarSuelo.position.x *= -1
		salio_de_camara = false
	
	aplicar_movimiento()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Camara_ajuste"):
		salio_de_camara = true

