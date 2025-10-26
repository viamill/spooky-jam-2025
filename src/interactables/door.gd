extends Interactable


@export_range(-360, 360, 1, "radians_as_degrees") var open_rotation = 0

var _is_open: bool = false
var _closed_rotation: float = 0

func _ready() -> void:
	_closed_rotation = rotation.y


func interact() -> void:
	if _is_open:
		rotation.y = _closed_rotation
		_is_open = false
	else:
		rotation.y = deg_to_rad(open_rotation)
		_is_open = true
