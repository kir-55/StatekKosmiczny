extends Node2D

@export var sprite: Sprite2D
@export var collision_shape: CollisionShape2D
@export var explosion_sound_prefab: PackedScene

@export var max_hp: int = 100
var hp:int

func _ready():
	hp = max_hp
	if (abs(get_tree().get_root().get_node("Game/Player").global_position.y + global_position.y)>700):
		var project_scale = GlobalVariables.pixels_scale
		print(randi())
		sprite.scale = Vector2(project_scale, project_scale)
		var sprite_size = sprite.texture.get_size()		
		collision_shape.shape.radius = (sprite_size.x / 2) * project_scale


func take_damage(value):
	hp -= value
	
	if hp <= 0:
		var explosion_sound= explosion_sound_prefab.instantiate()
		add_child(explosion_sound)
		queue_free()


func _on_killzone_body_entered(body):
	body.queue_free()
