extends Interactable


@export var lights: Array[Light3D]

var _is_on: bool = true


func interact() -> void:
	if _is_on:
		for light in lights:
			light.visible = false
		_is_on = false
	else:
		for light in lights:
			light.visible = true
		_is_on = true
