extends Interactable


var _is_on: bool = true

@export var lights: Array[Light3D]


func interact() -> void:
	if _is_on:
		for light in lights:
			light.visible = false
		_is_on = false
	else:
		for light in lights:
			light.visible = true
		_is_on = true
