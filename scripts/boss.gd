extends CharacterBody2D

@export var health = 100

var y_speed
var x_speed = 5
@onready var player = get_tree().root.get_node("Game/Player")
@onready var camera_center = get_tree().root.get_node("Game/Camera2D").get_screen_center_position().x

func _ready():
	position.x = camera_center
	position.y = player.position.y - 600

func _physics_process(delta):
	
	y_speed = player.y_speed
	velocity.y = y_speed * -1
	

	move_and_slide()

func take_damage(value):
	health -= value
	if health <= 0:
		queue_free()
