extends Node


@onready var player: Player = $House_Level/Player
@onready var anomaly: GameManager.Anomaly
var anomaly_node: Node3D
var anomaly_cleansed = false

func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	set_anomaly()

func set_anomaly():
	anomaly = GameManager.cur_anomaly
	if anomaly == GameManager.Anomaly.NONE:
		anomaly_cleansed = true
	else:
		anomaly_node = $House_Level/HouseDesign/Sleeping/Bed
	print(anomaly)
