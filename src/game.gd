class_name Game
extends Node

@onready var player: Player = $House_Level/Player

@onready var broken_anom_parent: Node = $AnomParents/BrokenAnomParent
@onready var placed_anom_parent: Node = $AnomParents/PlacedAnomParent
@onready var moved_anom_parent: Node = $AnomParents/MovedAnomParent
@onready var electronic_anom_parent: Node = $AnomParents/ElectronicAnomParent
@onready var visual_anom_parent: Node = $AnomParents/VisualAnomParent
@onready var audio_anom_parent: Node = $AnomParents/AudioAnomParent

#var current_haunted_item: HauntedInteractable

func get_anomaly(type: GameManager.AnomalyType) -> Node:
	var selected: Node = null
	match type:
		GameManager.AnomalyType.BROKEN:
			selected = broken_anom_parent
		GameManager.AnomalyType.PLACED:
			selected = placed_anom_parent
		GameManager.AnomalyType.MOVED:
			selected = moved_anom_parent
		GameManager.AnomalyType.ELECTRONIC:
			selected = electronic_anom_parent
		GameManager.AnomalyType.VISUAL:
			selected = visual_anom_parent
		GameManager.AnomalyType.AUDIO:
			selected = audio_anom_parent
		_:
			return null
	print("Anom Type: ", GameManager.AnomalyType.keys()[type])
	return selected.haunt_item()
	#var options = selected.get_children()
	#options.shuffle()
	#if options.size() == 0:
		#return null
	#else:
		#return options[0]


func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	GameManager.load(self)
	#GameManager.game = self
	#GameManager.set_anomaly()

"""
	set_anomaly()


func set_anomaly():
	anomaly = GameManager.cur_anomaly
	
	match anomaly:
		GameManager.Anomaly.ELECTRONIC:
			current_haunted_item = electronic_anomalies.haunt_item()
		GameManager.Anomaly.BROKEN:
			current_haunted_item = broken_anomalies.haunt_item()
		GameManager.Anomaly.PLACED:
			current_haunted_item = placed_anomalies.haunt_item()
		GameManager.Anomaly.AUDIO:
			current_haunted_item = audio_anomalies.haunt_item()
		GameManager.Anomaly.NONE:
			return
	
	current_haunted_item.is_cleansed = false
"""
