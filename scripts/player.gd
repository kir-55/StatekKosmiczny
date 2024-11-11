extends CharacterBody2D

@export var root_node: Node

@export var speed: float = 300.0  # Maksymalna prędkość w osi X
@export var y_speed: float = 500.0  # Prędkość w osi Y

@export var smoothing_factor: float = 0.05  # Miękkość zmiany kierunku (0.0 - natychmiastowo, 1.0 - brak ruchu)

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	
	# Pryzspieszanie samolotu
	y_speed += delta * 10
	
	# Oblicz docelową prędkość w osi X
	var target_velocity_x = direction * speed
	
	# Płynne przejście (smoothing)
	velocity.x = lerp(velocity.x, target_velocity_x, smoothing_factor)

	# Ruch w osi Y (np. upadek)
	velocity.y = y_speed * -1

	# Przesuń postać
	move_and_slide()



