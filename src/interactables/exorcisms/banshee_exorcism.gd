extends Interactable


@onready var exorcism: Node3D = $".."


func interact() -> void:
	if GameManager.ghost.type == GameManager.GhostType.BANSHEE:
		exorcism.menus.end_game(true)
	else:
		exorcism.menus.end_game(false)
