extends Node

enum GhostType {POLTERGEIST, DEMON, BANSHEE, WRAITH}
enum AnomalyType {NONE, BROKEN, PLACED, MOVED, ELECTRONIC, VISUAL, AUDIO}


var ghost : Ghost
var game : Game

#On game start, a ghost is chosen and the scene is loaded without an anomaly
func start_game():
	ghost = Ghost.new()
	get_tree().change_scene_to_file("res://src/game.tscn")
	
#The game continues until all anomalies are popped from the array
func next():
	var next_anomaly = ghost.get_next_anomaly()
	if next_anomaly != null:
		get_tree().change_scene_to_file("res://src/game.tscn")
	else:
		print("GAME ENDING")
		var menu = get_node("/root/Game/Menus")
		menu.end_game(true)




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
