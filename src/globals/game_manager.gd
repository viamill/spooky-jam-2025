extends Node

enum GhostType {POLTERGEIST, DEMON, BANSHEE, WRAITH}
enum AnomalyType {NONE, BROKEN, PLACED, MOVED, ELECTRONIC, VISUAL, AUDIO}


var ghost : Ghost
var cur_anomaly : AnomalyType 

#On game start, a ghost is chosen and the scene is loaded without an anomaly
func start_game():
	ghost = Ghost.new()
	cur_anomaly = AnomalyType.NONE
	get_tree().change_scene_to_file("res://src/game.tscn")
	
#The game continues until all anomalies are popped from the array
func next():
	var next_anomaly = ghost.possible_anomalies.pop_back()
	if next_anomaly != null:
		cur_anomaly = next_anomaly
		get_tree().change_scene_to_file("res://src/game.tscn")
	else:
		#TODO: Create ghost choosing
		print("GAME WIN")





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
