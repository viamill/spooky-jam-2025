class_name BrokenAnomalies
extends Anomalies


func haunt_item() -> HauntedInteractable:
	var children = get_children().filter(func(child): return child is HauntedInteractable)
	children.shuffle()
	print(children.back())
	children.back().haunt()
	return children.back()
