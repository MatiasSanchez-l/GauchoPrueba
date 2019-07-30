extends TileMap

func _ready():
	for tile in get_used_cells():
		var nombre_tile = get_tileset().tile_get_name(get_cellv(tile))
		var node = load(str("res://Enemigos/", nombre_tile, ".tscn")).instance()
		node.global_position = map_to_world(tile) + Vector2(16,16) + get_tileset().tile_get_texture_offset(get_cellv(tile))
		get_parent().call_deferred("add_child", node)
	clear()
