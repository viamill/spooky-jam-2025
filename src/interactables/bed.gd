extends Interactable

@onready var game = get_tree().current_scene

func interact() -> void:
	if game.anomaly_cleansed:
		GameManager.next()
	else:
		var menu = get_node("/root/Game/Menus")
		menu.end_game(false)
