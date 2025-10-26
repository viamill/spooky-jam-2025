extends Control

@onready var pause = $Pause
@onready var journal = $Journal
@onready var game_over = $GameOver
@onready var game_over_text = $GameOver/EndState
var cur_menu : Control = null

func _ready() -> void:
	print(get_path())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		print("escape")
		if !cur_menu: open_menu(pause)
		else: close_menu()
	elif event.is_action_pressed("journal") and !cur_menu:
		open_menu(journal)

func end_game(win : bool):
	if win: game_over_text.text = "You exorcised the ghost!"
	else: game_over_text.text = "You've been possessed!"
	open_menu(game_over)

func open_menu(menu : Control):
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	cur_menu = menu
	cur_menu.visible = true
	
func close_menu():
	cur_menu.visible = false
	cur_menu = null
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false

func quit() -> void:
	get_tree().paused = false
	InputStack.reset()
	get_tree().change_scene_to_file("res://src/main_menu.tscn")

func restart() -> void:
	get_tree().paused = false
	GameManager.start_game()
