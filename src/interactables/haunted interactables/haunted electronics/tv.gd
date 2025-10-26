extends ElectronicInteractable


var _is_on: bool = false

@onready var label_3d: Label3D = $Label3D


func interact() -> void:
	is_interacted = true
	if _is_on:
		label_3d.visible = false
		_is_on = false
	else:
		label_3d.visible = true
		_is_on = true


func haunt() -> void:
	while not is_interacted:
		label_3d.visible = not label_3d.visible
		await get_tree().create_timer(randf_range(0.1, 0.5)).timeout
