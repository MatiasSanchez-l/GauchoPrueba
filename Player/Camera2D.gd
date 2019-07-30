extends Camera2D

func _process(delta):
    #pausa
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused