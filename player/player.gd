class_name Player
extends CharacterBody3D


@export var walk_speed: float = 1.8
@export var acceleration: float = 15.0

var mouse_sensitivity: float = 0.1

var _input_dir: Vector2

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var dir: Vector3 = (transform.basis * Vector3(_input_dir.x, 0.0, _input_dir.y)).normalized()
	
	if dir:
		velocity.x = move_toward(velocity.x, dir.x * walk_speed, delta * acceleration)
		velocity.z = move_toward(velocity.z, dir.z * walk_speed, delta * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0.0, delta * acceleration)
		velocity.z = move_toward(velocity.z, 0.0, delta * acceleration)
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-deg_to_rad(event.relative.x * mouse_sensitivity))
		head.rotate_x(-deg_to_rad(event.relative.y * mouse_sensitivity))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(-89), deg_to_rad(90))
	
	_input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
