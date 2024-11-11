extends Node2D

@export var sprite: Sprite2D
@export var collision_shape: CollisionShape2D
@export var explosion_sound_prefab: PackedScene

@export var max_hp: int = 100
var hp:int

func _ready():
	hp = max_hp
 	
	var project_scale = GlobalVariables.pixels_scale
	print("size: " + str(project_scale))
	sprite.scale = Vector2(project_scale, project_scale)
	var sprite_size = sprite.texture.get_size()
	
	# Duplikuj kształt, aby był unikalny dla tej instancji
	collision_shape.shape = collision_shape.shape.duplicate() 
	collision_shape.shape.radius = (sprite_size.x / 2) * project_scale

func take_damage(value):
	hp -= value
	
	if hp <= 0:
		var explosion_sound= explosion_sound_prefab.instantiate()
		get_parent().add_child(explosion_sound)
		queue_free()


func _on_killzone_body_entered(body):
	if body.is_in_group("asteroid"):
		queue_free()
	elif body.is_in_group("player"):
		get_tree().change_scene_to_file("res://menus/play.tscn")
