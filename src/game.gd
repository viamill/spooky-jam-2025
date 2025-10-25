extends Node


@onready var player: Player = $TestRange/Player


func _ready() -> void:
	InputStack.register_input_callback(player.handle_input)
