extends Camera2D

func _process(delta):
	var posicion = get_node("../Player").global_position
	var x = floor(posicion.x / 640) * 640
	var y = floor(posicion.y / 320) * 320
	global_position = Vector2(x,y)
