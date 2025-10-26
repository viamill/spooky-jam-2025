class_name Ghost extends Node

var type : GameManager.GhostType
var possible_anomalies : Array[GameManager.AnomalyType]
var cur_anomaly_type : GameManager.AnomalyType
var cur_anomaly : Node

func _init() -> void:
	type = GameManager.GhostType[GameManager.GhostType.keys().pick_random()]
	match type:
		GameManager.GhostType.POLTERGEIST:
			possible_anomalies = [GameManager.AnomalyType.NONE, GameManager.AnomalyType.AUDIO, GameManager.AnomalyType.VISUAL, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
		GameManager.GhostType.DEMON:
			possible_anomalies = [GameManager.AnomalyType.BROKEN, GameManager.AnomalyType.PLACED, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
		GameManager.GhostType.BANSHEE:
			possible_anomalies = [GameManager.AnomalyType.NONE, GameManager.AnomalyType.AUDIO, GameManager.AnomalyType.VISUAL, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
		GameManager.GhostType.WRAITH:
			possible_anomalies = [GameManager.AnomalyType.NONE, GameManager.AnomalyType.AUDIO, GameManager.AnomalyType.VISUAL, GameManager.AnomalyType.NONE, GameManager.AnomalyType.NONE]
	possible_anomalies.shuffle()	
	cur_anomaly_type = GameManager.AnomalyType.NONE
	cur_anomaly = null

func get_next_anomaly() -> GameManager.AnomalyType:
	cur_anomaly_type = possible_anomalies.pop_back()
	cur_anomaly = GameManager.game.get_anomaly(cur_anomaly_type)
	return cur_anomaly_type
