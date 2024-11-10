extends Node2D

@onready var sprite = $Sprite2D
@onready var collision_shape = get_node("Killzone/CollisionShape2D")
@export var explosion_sound_prefab: PackedScene



var max_hp = 100
var hp

func _ready():
	hp = max_hp
	
	var project_scale = GlobalVariables.pixels_scale
	
	sprite.scale = Vector2(project_scale, project_scale)
	var sprite_size = sprite.texture.get_size()
	collision_shape.shape.radius = (sprite_size.x / 2) * project_scale


func _on_body_entered(body):
	body.queue_free()

func take_damage(value):
	hp -= value
	
	if hp <= 0:
		var explosion_sound= explosion_sound_prefab.instantiate()
		add_child(explosion_sound)
		queue_free()
