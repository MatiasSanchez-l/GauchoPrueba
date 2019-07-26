extends TileMap

func _ready():
	for tile in get_used_cells():
		var nombre_tile = get_tileset().tile_get_name(get_cellv(tile))
		
		var node
		if nombre_tile.begins_with("tile_"):
			nombre_tile.replace("tile_", "")
			node = load(str("res://tiles/", nombre_tile, ".tscn")).instance()
		else:
			node = load(str("res://Enemigos/", nombre_tile, ".tscn")).instance()
		node.global_position = map_to_world(tile) + Vector2(4,4) + get_tileset().tile_get_texture_offset(get_cellv(tile))
		get_parent().call_deferred("add_child", node)
	clear()
