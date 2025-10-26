class_name Game
extends Node


var anomaly: GameManager.Anomaly
var current_haunted_item: HauntedInteractable

@onready var player: Player = $Player
@onready var menus: Control = $Menus
@onready var electronic_anomalies: Anomalies = $ElectronicAnomalies
@onready var broken_anomalies: BrokenAnomalies = $BrokenAnomalies
@onready var placed_anomalies: PlacedAnomalies = $PlacedAnomalies
@onready var audio_anomalies: AudioAnomalies = $AudioAnomalies
@onready var exorcism: Node3D = $Exorcism


func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
	if GameManager.start_exorcism:
		exorcism.start()
		return
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
