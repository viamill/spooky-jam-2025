class_name VisualAnomalies
extends Anomalies



func haunt_item() -> HauntedInteractable:
	var children = get_children()
	children.shuffle()
	print(children.back())
	children.back().haunt()
	return children.back()
