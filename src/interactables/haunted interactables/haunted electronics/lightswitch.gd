extends ElectronicInteractable


var _is_on: bool = true

@export var lights: Array[Light3D]


func interact() -> void:
	is_interacted = true
	if _is_on:
		for light in lights:
			light.light_energy = 10.0
			light.visible = false
		_is_on = false
	else:
		for light in lights:
			light.visible = true
		_is_on = true


func haunt() -> void:
	while not is_interacted:
		for light in lights:
			light.light_energy = randf_range(0.0, 10.0)
		await get_tree().create_timer(randf_range(0.05, 0.1)).timeout
