extends Interactable

@onready var game = get_tree().current_scene

func interact() -> void:
	if game.anomaly_cleansed:
		GameManager.next()
	else:
		print("GAME LOSS")
