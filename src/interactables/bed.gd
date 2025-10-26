class_name Bed
extends Interactable

@onready var game: Game = get_tree().current_scene

func interact() -> void:
	if not game.current_haunted_item or game.current_haunted_item.is_cleansed:
		GameManager.next()
	else:
		game.menus.end_game(false)
