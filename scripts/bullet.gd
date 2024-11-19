extends Area2D

@export var speed = 1400

func _physics_process(delta):
	position += Vector2.UP.rotated(global_rotation) * speed * delta
	

func _on_destroy_timer_timeout():
	queue_free()


func _on_area_entered(area):
		if area.is_in_group("asteroid"):
			area.get_parent().take_damage(10)
			queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemies"):
			body.take_damage(10)
			queue_free()
