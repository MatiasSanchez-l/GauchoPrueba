extends Enemigo

func _physics_process(delta):
	gravedad()
	vida()
	aplicar_movimiento()

func _on_Timer_timeout():
	if is_on_floor():
		saltar() 
