extends Interactable


@onready var label_3d: Label3D = $Label3D


var _is_on: bool = false


func interact() -> void:
	if _is_on:
		label_3d.visible = false
		_is_on = false
	else:
		label_3d.visible = true
		_is_on = true
