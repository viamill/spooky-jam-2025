class_name ElectronicsAnomalies
extends Anomalies


@onready var lights_node: Node = $Lights


func haunt_item() -> Interactable:
	var possessed_electronic: ElectronicInteractable
	var electronics = get_children()
	electronics.shuffle()
	var electronic = electronics.front()
	
	if electronic == lights_node:
		var lights = lights_node.get_children()
		lights.shuffle()
		possessed_electronic = lights.front()
	else:
		possessed_electronic = electronic
		
	possessed_electronic.haunt()
	print(possessed_electronic)
	possessed_electronic.is_interacted = false
	return possessed_electronic
