extends Node

var bullets_amount: int

@export var root_node: Node
@export var bullet_prefabs: Array[PackedScene]
@export var current_bullet_type: int

var cannons: Array[Node]
@onready var player = $".."
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

func _ready():
	cannons = get_children()
	print(get_children().size())

func _process(delta):
	if Input.is_action_pressed("shoot") and bullet_prefabs and bullet_prefabs.size() > 0 and current_bullet_type < bullet_prefabs.size():
		if bullets_amount >= cannons.size():
			for cannon in cannons:
				var bullet = bullet_prefabs[current_bullet_type].instantiate()
				bullet.global_position = cannon.global_position
				root_node.add_child(bullet)
				bullets_amount -= 1

				# Odtwórz animację strzału gracza
				if animated_sprite_2d:
					animated_sprite_2d.play("Shoot")

func _on_timer_timeout():
	bullets_amount += 1

