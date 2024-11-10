extends Area2D

@export var speed = 1400

func _physics_process(delta):
	position += Vector2.UP.rotated(global_rotation) * speed * delta
	

func _on_body_entered(body):
	if body.is_in_group("asteroid"):
		body.take_damage(1)
		queue_free()


func _on_destroy_timer_timeout():
	queue_free()
