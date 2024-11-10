extends Node2D

@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D

var max_hp = 100
var hp

func _ready():
	hp = max_hp
	
	var sprite_size = sprite.texture.get_size()
	collision_shape.shape.radius = sprite_size.x * 6


func _on_body_entered(body):
	body.queue_free()

func take_damage(value):
	hp -= value
	
	if hp <= 0:
		queue_free()
