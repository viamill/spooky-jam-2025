class_name Player
extends CharacterBody3D


@export var walk_speed: float = 5.0
@export var acceleration: float = 20.0

var mouse_sensitivity: float = 0.25

var _input_dir: Vector2
var has_sage: bool = true

@onready var game: Game = get_tree().current_scene
@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera
@onready var raycast: RayCast3D = $Head/Raycast
@onready var label: Label = $Control/Label


func _physics_process(delta: float) -> void:
	label.visible = false
	if raycast.is_colliding():
		var collider: Object = raycast.get_collider()
		if collider is Interactable:
			label.visible = true
	
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
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	_input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	if event is InputEventMouseMotion:
		rotate_y(-deg_to_rad(event.relative.x * mouse_sensitivity))
		head.rotate_x(-deg_to_rad(event.relative.y * mouse_sensitivity))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(-89), deg_to_rad(90))
	
	if event.is_action_pressed("interact"):
		var collider: Object = raycast.get_collider()
		if collider and collider is Interactable:
			collider.interact()
	
	if event.is_action_pressed("cleanse"):
		if has_sage:
			print("You used your sage!")
			has_sage = false
			var current_haunted_item: HauntedInteractable = game.current_haunted_item
			if global_position.distance_to(current_haunted_item.global_position) <= 5.0:
				game.current_haunted_item.is_cleansed = true
