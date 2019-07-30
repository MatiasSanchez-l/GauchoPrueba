extends Enemigo

var salio_de_camara = false

func _physics_process(delta):
	movimiento_vertical()
	vida()

	if is_on_floor() || is_on_ceiling() || salio_de_camara:
		movimientoDir = -movimientoDir
		position.y += movimientoDir * 2
		salio_de_camara = false
	
	aplicar_movimiento()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Camara_ajuste"):
		salio_de_camara = true