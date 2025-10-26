extends HauntedInteractable


@onready var normal_collision: CollisionShape3D = $NormalCollision
@onready var normal_mesh: MeshInstance3D = $NormalMesh
@onready var haunted_collision: CollisionShape3D = $HauntedCollision
@onready var haunted_mesh: MeshInstance3D = $HauntedMesh


func _ready() -> void:
	normal_collision.disabled = false
	normal_mesh.visible = true
	haunted_collision.disabled = true
	haunted_mesh.visible = false


func haunt() -> void:
	normal_collision.disabled = true
	normal_mesh.visible = false
	haunted_collision.disabled = false
	haunted_mesh.visible = true
