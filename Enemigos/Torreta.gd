extends StaticBody2D

func _ready():
	$Timer.connect("timeout", self, "timeout")
	
func timeout():
	var proyectil_derecho = preload("res://Enemigos/ProyectilEnemigo.tscn").instance()
	var proyectil_izquierdo = preload("res://Enemigos/ProyectilEnemigo.tscn").instance()
	get_parent().add_child(proyectil_derecho)
	get_parent().add_child(proyectil_izquierdo)
	proyectil_derecho.movimientoDir = Vector2(1,0)
	proyectil_izquierdo.movimientoDir = Vector2(-1,0)
	proyectil_derecho.position = $PositionDerecha.global_position
	proyectil_izquierdo.position = $PositionIzquierda.global_position