extends Area2D

@export var speed = 600

func _physics_process(delta):
	position += Vector2.DOWN.rotated(global_rotation) * speed * delta
	

func _on_destroy_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(10)
		queue_free()
