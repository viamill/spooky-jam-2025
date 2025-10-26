class_name PlacedAnomalies
extends Anomalies


@onready var ghost_orb: HauntedInteractable = $"../House_Level/GhostOrb"


func haunt_item() -> HauntedInteractable:
	ghost_orb.visible = true
	var positions = get_children()
	positions.shuffle()
	ghost_orb.global_position = positions.front().global_position
	print("ghost_orb")
	return ghost_orb
