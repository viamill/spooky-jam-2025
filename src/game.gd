extends Node

#This takes type of anomaly and sets 
@onready var player: Player = $House_Level/Player
@onready var anomaly: GameManager.AnomalyType
var anomaly_cleansed = true

@onready var broken_anom_parent: Node = $BrokenAnomParent
@onready var placed_anom_parent: Node = $PlacedAnomParent
@onready var moved_anom_parent: Node = $MovedAnomParent
@onready var electronic_anom_parent: Node = $ElectronicAnomParent
@onready var visual_anom_parent: Node = $VisualAnomParent
@onready var audio_anom_parent: Node = $AudioAnomParent


#Needs array of objects

func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	set_anomaly()

func set_anomaly() -> void:
	anomaly = GameManager.cur_anomaly
	print(anomaly)
