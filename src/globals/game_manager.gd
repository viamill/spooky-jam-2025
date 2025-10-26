extends Node

enum GhostType {POLTERGEIST, DEMON, WRAITH}
enum AnomalyType {NONE, BROKEN, PLACED, MOVED, ELECTRONIC, VISUAL, AUDIO}


var ghost : Ghost
var game : Game
var anomaly_cleansed = true
var last_round : bool = false
var _started = false

#On game start, a ghost is chosen and the scene is loaded without an anomaly
func start_game():
	ghost = Ghost.new()
	anomaly_cleansed = true
	get_tree().change_scene_to_file("res://src/game.tscn")

#The game continues until all anomalies are popped from the array
func next():
	if not anomaly_cleansed:
		var menu = get_node("/root/Game/Menus")
		menu.end_game(false)
	else:
		if ghost.possible_anomalies.size() > 0:
			get_tree().change_scene_to_file("res://src/game.tscn")
		else:
			anomaly_cleansed = false
			last_round = true
			get_tree().change_scene_to_file("res://src/game.tscn")

func load(g : Game):
	game = g
	if (_started):
		var next_anomaly = ghost.get_next_anomaly()
		anomaly_cleansed = next_anomaly == GameManager.AnomalyType.NONE
		if last_round:
			var exorcism =  load("res://src/interactables/exorcism.tscn").instantiate()
			game.add_child(exorcism)
			exorcism.global_position = Vector3(8.5, 2.15, 5.995)
	else:
		_started = true

func try_cleanse():
		#TODO: Implement cleasing code
		pass

"""
Choose random ghost
Take list of anoms, shuffles, loads scene without any anomolies
goto bed
LOOP:
	either one or 0 anomalies
	if no anoms, go to bed.
	if tere is, clense with sage then bed
	if survived all days
		then choose which ghost you think it is.
	

BrokenAnom
	List of items
PlacedAnom
	List of items
		List of locations
MovedAnom
	List of items
ElectronicAnom
	List of items
VisualAnom
	List of items
		List of locations
AudioAnom
	List of items


getchildren.sort()

"""
