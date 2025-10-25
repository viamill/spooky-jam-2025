extends Node


@onready var player: Player = $House_Level/Player
@onready var anomaly: GameManager.Anomaly
var anomaly_cleansed = true

func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	set_anomaly()

func set_anomaly():
	anomaly = GameManager.cur_anomaly
	print(anomaly)
