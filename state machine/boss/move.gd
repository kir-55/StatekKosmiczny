class_name BossMove
extends State

@export var boss : Node

var move_time

func Enter():
	move_time = randf_range(2.5, 7)

func Update(delta: float):
	if move_time > 0:
		move_time -= delta
	else:
		RequestTransition.emit(self, "AttackBurst")

func Physics_Update(delta: float):
	
	if boss.is_on_wall():
		boss.x_speed *= -1
		
	boss.position.x += boss.x_speed
