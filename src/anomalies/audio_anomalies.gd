class_name AudioAnomalies
extends Anomalies



func haunt_item() -> HauntedInteractable:
	var children = get_children()
	children.shuffle()
	children.back().haunt()
	print("door")
	return children.back()
