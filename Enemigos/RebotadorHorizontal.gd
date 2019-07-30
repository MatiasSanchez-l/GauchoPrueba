extends Enemigo

var salio_de_camara = false

func _physics_process(delta):
	movimiento_horizontal()
	vida()

	if is_on_wall() || salio_de_camara:
		movimientoDir = -movimientoDir
		position.x += movimientoDir * 2
		salio_de_camara = false
	
	aplicar_movimiento()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Camara_ajuste"):
		salio_de_camara = true