extends Panel

@export var best_label: Label
@export var last_label: Label

func _ready():
	if GlobalVariables.player_best_score != 0:
		best_label.text = "Best Score: " + str(GlobalVariables.player_best_score)
	if GlobalVariables.player_last_score != 0:
		last_label.text = "Last Score: " + str(GlobalVariables.player_last_score)
		

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_store_button_pressed():
	get_tree().change_scene_to_file("res://menus/store.tscn")

func _on_exit_game_button_pressed():
	get_tree().quit()
