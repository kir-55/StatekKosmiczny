extends Panel

var player_tier = 0 # players current spaceship tier (idk how to add this) should be equal to actual player tier

func _ready():
	if player_tier >= 2:
		%UpgradeButton.disabled = true

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://menus/play.tscn")

func _on_upgrade_button_pressed():
	if player_tier + 1 >= 2: # last tier
		%UpgradeButton.disabled = true
		return
	
	player_tier += 1
