extends Camera2D

@export var player: Node2D
@export var y_offset: int = 300

func _process(delta):
	global_position.y = player.global_position.y - y_offset
