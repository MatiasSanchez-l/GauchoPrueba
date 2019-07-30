extends Enemigo

func _ready():
	movimientoDir = Vector2()
	velocidad = 150

func _physics_process(delta):
	movimiento = movimientoDir * delta * velocidad
	if move_and_collide(movimiento):
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
