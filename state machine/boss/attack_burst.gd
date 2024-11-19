class_name BossAttackBurst
extends State

@export var boss : Node
@export var bullet_prefabs: Array[PackedScene]
@export var current_bullet_type: int
@export var bullets_amount := 15
@export var shooting_delay := 0.1

var cannons: Array[Node]

func Enter():
	cannons = boss.get_node("Cannons").get_children()
	if bullet_prefabs and bullet_prefabs.size() > 0 and current_bullet_type < bullet_prefabs.size():
		for i in range(0, bullets_amount):
			for cannon in cannons:
				var bullet = bullet_prefabs[current_bullet_type].instantiate()
				bullet.global_position = cannon.global_position
				get_tree().root.get_node("Game").add_child(bullet)
			await get_tree().create_timer(0.1).timeout
	RequestTransition.emit(self, "Move")
