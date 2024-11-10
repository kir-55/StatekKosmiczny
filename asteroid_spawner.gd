extends Node

@export var player: Node2D
@export var asteroid_prefab: PackedScene
@export var asteroids: Array[AsteroidType]
@export var y_offset: int = 900

func _on_timer_timeout():
	var asteroid_type = randi()%asteroids.size();
	
	var asteroid = asteroid_prefab.instantiate()
	asteroid.get_node("Sprite2D").texture = asteroids[asteroid_type].sprite
	asteroid.max_hp = asteroids[asteroid_type].max_hp
	asteroid.global_position.x = randi()%1100-550#player.global_position.x
	asteroid.global_position.y = player.global_position.y - y_offset
	
	add_child(asteroid)
