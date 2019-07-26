extends StaticBody2D

onready var area = $Area2D

func _ready():
	add_to_group("Spawn")

func _process(delta):
	var player = get_tree().get_nodes_in_group("Player")[0]
	
	if area.get_overlapping_bodies().has(player) && Input.is_action_just_pressed("ui_accept"):
		for Spawn in get_tree().get_nodes_in_group("Spawn"):
			Spawn.modulate = Color( 0.94, 0.97, 1, 1 )
		
		player.spawn = position - Vector2(0, 16)
		modulate = Color( 0, 1, 1, 1 )
	

	
