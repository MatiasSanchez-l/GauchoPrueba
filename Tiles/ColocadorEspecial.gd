extends TileMap

func _ready():
	for tile in get_used_cells():
		var nombre_tile = get_tileset().tile_get_name(get_cellv(tile))
		nombre_tile = nombre_tile.replace("Tile_", "")
		
		var node = load(str("res://Tiles/", nombre_tile, ".tscn")).instance()
		node.global_position = map_to_world(tile) + Vector2(32,8) + get_tileset().tile_get_texture_offset(get_cellv(tile))
		get_parent().call_deferred("add_child", node)
	clear()