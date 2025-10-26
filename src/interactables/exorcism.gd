extends Interactable

@export var type : GameManager.GhostType

@onready var menu = get_node("/root/Game/Menus")

func interact() -> void:
	menu.end_game(type == GameManager.ghost.type)
