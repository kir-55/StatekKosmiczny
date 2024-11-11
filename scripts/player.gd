extends CharacterBody2D


@export var root_node: Node

@export var speed = 300.0

@export var y_speed = 500.0

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	velocity.y = y_speed * -1

	move_and_slide()
	

