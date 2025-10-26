class_name AnomItem
extends Node3D

@export var norm_version: Node3D
@export var anom_version: Node3D
var cleansed = true

func _ready() -> void:
	cleansed = true
	norm_version.visible = true
	anom_version.visible = false

func possess() -> void:
	norm_version.visible = false
	anom_version.visible = true
	cleansed = false
	
func cleanse() -> void:
	cleansed = true
