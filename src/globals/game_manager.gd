extends Node

enum Anomaly {NONE, BROKEN, PLACED, AUDIO, VISUAL, ELECTRONIC}
enum GhostType {DEMON, POLTERGEIST, BANSHEE}

var ghost : Ghost
var cur_anomaly : Anomaly 

func start_game():
	ghost = Ghost.new()
	cur_anomaly = ghost.anomalies.pop_back()
	get_tree().change_scene_to_file("res://src/game.tscn")

func next():
	var next_anomaly = ghost.anomalies.pop_back()
	if next_anomaly != null:
		cur_anomaly = next_anomaly
		get_tree().change_scene_to_file("res://src/game.tscn")
	else:
		var menu = get_node("/root/Game/Menus")
		menu.end_game(true)
