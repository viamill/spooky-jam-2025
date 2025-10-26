class_name Player
extends CharacterBody3D


@export var walk_speed: float = 5.0
@export var acceleration: float = 20.0

var mouse_sensitivity: float = 0.25

var _input_dir: Vector2

var sage_not_used : bool = true

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera
@onready var raycast: RayCast3D = $Head/Raycast
@onready var game = get_tree().current_scene


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


func handle_input(event: InputEvent) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	_input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	if event is InputEventMouseMotion:
		rotate_y(-deg_to_rad(event.relative.x * mouse_sensitivity))
		head.rotate_x(-deg_to_rad(event.relative.y * mouse_sensitivity))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(-89), deg_to_rad(90))
	else: #This is to make it so I can look around on remote desktop! - Richard	
		var _mouse_input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		rotate_y(-deg_to_rad(_mouse_input_dir.x * 10 * mouse_sensitivity))
		head.rotate_x(-deg_to_rad(_mouse_input_dir.y * 10 * mouse_sensitivity))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(-89), deg_to_rad(90))
	

	
	if event.is_action_pressed("interact"):
		var collider: Object = raycast.get_collider()
		if collider and collider is Interactable:
			collider.interact()
			
	if event.is_action_pressed("sage") and sage_not_used:
		sage_not_used = false
		if (GameManager.ghost.cur_anomaly_type == GameManager.AnomalyType.NONE):
			#if we think its too difficult, we could remove this
			var menu = get_node("/root/Game/Menus")
			menu.end_game(false)
		elif global_position.distance_to(GameManager.ghost.cur_anomaly.global_position) <= 5:
			game.anomaly_cleansed = true
