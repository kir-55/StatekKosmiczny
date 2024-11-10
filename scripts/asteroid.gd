extends Node2D

@onready var sprite = $Sprite2D
@onready var collision_shape = get_node("Killzone/CollisionShape2D")

@export var max_hp: int = 100
var hp:int

func _ready():
	hp = max_hp
	
	var project_scale = GlobalVariables.pixels_scale
	
	sprite.scale = Vector2(project_scale, project_scale)
	var sprite_size = sprite.texture.get_size()
	collision_shape.shape.radius = (sprite_size.x / 2) * project_scale


func take_damage(value):
	hp -= value
	
	if hp <= 0:
		queue_free()


func _on_killzone_body_entered(body):
	body.queue_free()
