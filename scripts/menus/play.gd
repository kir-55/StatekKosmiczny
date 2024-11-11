extends Panel

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_store_button_pressed():
	get_tree().change_scene_to_file("res://menus/store.tscn")

func _on_exit_game_button_pressed():
	get_tree().quit()
