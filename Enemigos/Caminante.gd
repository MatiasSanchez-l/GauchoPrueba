extends Enemigo

func _physics_process(delta):
	movimiento_horizontal()
	gravedad()
	vida()
	
	if is_on_wall() || $DetectarSuelo.is_colliding() == false:
		dar_vuelta()
		$DetectarSuelo.position.x *= -1
	
	aplicar_movimiento()
	
func _on_TimerMuerte_timeout():
	queue_free()
