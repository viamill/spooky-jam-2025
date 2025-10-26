class_name BrokenAnomalies
extends Anomalies


func haunt_item() -> HauntedInteractable:
	var children = get_children().filter(func(child): return child is HauntedInteractable)
	children.shuffle()
	children.back().haunt()
	print("mirror")
	return children.back()
