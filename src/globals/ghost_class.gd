class_name Ghost extends Node

var type : GameManager.GhostType
var possible_anomalies : Array[GameManager.AnomalyType]


func _init() -> void:
	var g_index = randi_range(0, 1)
	match g_index:
		0:
			type = GameManager.GhostType.DEMON
			possible_anomalies = [GameManager.AnomalyType.BROKEN, GameManager.AnomalyType.PLACED, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
			possible_anomalies.shuffle()
		1:
			type = GameManager.GhostType.BANSHEE
			possible_anomalies = [GameManager.AnomalyType.NONE, GameManager.AnomalyType.AUDIO, GameManager.AnomalyType.VISUAL, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
			possible_anomalies.shuffle()
