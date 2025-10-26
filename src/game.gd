extends Node

@onready var player: Player = $House_Level/Player

@onready var broken_anom_parent: Node = $AnomParents/BrokenAnomParent
@onready var placed_anom_parent: Node = $AnomParents/PlacedAnomParent
@onready var moved_anom_parent: Node = $AnomParents/MovedAnomParent
@onready var electronic_anom_parent: Node = $AnomParents/ElectronicAnomParent
@onready var visual_anom_parent: Node = $AnomParents/VisualAnomParent
@onready var audio_anom_parent: Node = $AnomParents/AudioAnomParent

func get_anomaly(type: GameManager.AnomalyType) -> Node3D:
	#TODO
	return null


func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	GameManager.set_anomaly()
