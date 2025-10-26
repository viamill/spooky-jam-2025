class_name Door
extends HauntedInteractable


@export_range(-360, 360, 1, "radians_as_degrees") var open_rotation = 0

var _is_open: bool = false
var _closed_rotation: float = 0
var _is_interacted: bool = false

@export var door_open: AudioStreamPlayer3D
@export var door_close: AudioStreamPlayer3D
@export var door_knock: AudioStreamPlayer3D


func _ready() -> void:
	_closed_rotation = rotation.y


func interact() -> void:
	_is_interacted = true
	if _is_open:
		rotation.y = _closed_rotation
		_is_open = false
		door_close.play()
		door_knock.stop()
	else:
		rotation.y = deg_to_rad(open_rotation)
		_is_open = true
		door_open.play()
		door_knock.stop()


func haunt() -> void:
	door_knock.play()
	
