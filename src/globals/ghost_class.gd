class_name Ghost extends Node

var type : GameManager.GhostType
var anomalies : Array[GameManager.Anomaly]

func _init() -> void:
	var g_index = randi_range(0, 2)
	match g_index:
		0:
			type = GameManager.GhostType.DEMON
			anomalies = [GameManager.Anomaly.BROKEN, GameManager.Anomaly.AUDIO, GameManager.Anomaly.BROKEN, GameManager.Anomaly.BROKEN, GameManager.Anomaly.ELECTRONIC]
			anomalies.shuffle()
			anomalies.append(GameManager.Anomaly.NONE)
		1:
			type = GameManager.GhostType.POLTERGEIST
			anomalies = [GameManager.Anomaly.AUDIO, GameManager.Anomaly.PLACED, GameManager.Anomaly.PLACED, GameManager.Anomaly.ELECTRONIC, GameManager.Anomaly.NONE]
			anomalies.shuffle()
			anomalies.append(GameManager.Anomaly.NONE)
		2:
			type = GameManager.GhostType.BANSHEE
			anomalies = [GameManager.Anomaly.ELECTRONIC, GameManager.Anomaly.ELECTRONIC, GameManager.Anomaly.AUDIO, GameManager.Anomaly.NONE, GameManager.Anomaly.NONE]
			anomalies.shuffle()
			anomalies.append(GameManager.Anomaly.NONE)
