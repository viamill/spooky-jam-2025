extends Node

enum Anomaly {NONE, BROKEN, PLACED, AUDIO, VISUAL, ELECTRONIC}
enum GhostType {DEMON, POLTERGEIST, BANSHEE}

var ghost : Ghost
var cur_anomaly : Anomaly 
var start_exorcism: bool = false
var text_notes: String = "My notes\n"


func start_game():
	ghost = Ghost.new()
	cur_anomaly = ghost.anomalies.pop_back()
	text_notes = "My notes\n"
	get_tree().change_scene_to_file("res://src/game.tscn")

func next():
	text_notes = get_node("/root/Game/Menus/Journal/TextEdit2").text
	var next_anomaly = ghost.anomalies.pop_back()
	
	if next_anomaly != null:
		cur_anomaly = next_anomaly
		get_tree().change_scene_to_file("res://src/game.tscn")
	else:
		start_exorcism = true
		get_tree().change_scene_to_file("res://src/game.tscn")
		
