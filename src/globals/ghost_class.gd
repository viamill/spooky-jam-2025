class_name Ghost extends Node

var type : GameManager.GhostType
var anomalies : Array[GameManager.Anomaly]

func _init() -> void:
	var g_index = randi_range(0, 1)
	match g_index:
		0:
			type = GameManager.GhostType.TEST
			anomalies = [GameManager.Anomaly.TEST1, GameManager.Anomaly.TEST2, GameManager.Anomaly.TEST3, GameManager.Anomaly.NONE, GameManager.Anomaly.NONE]
			anomalies.shuffle()
		1:
			type = GameManager.GhostType.TEST
			anomalies = [GameManager.Anomaly.TEST1, GameManager.Anomaly.TEST2, GameManager.Anomaly.TEST3, GameManager.Anomaly.NONE, GameManager.Anomaly.NONE]
			anomalies.shuffle()
