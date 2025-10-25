extends Node


var _callback_stack: Array[Callable] = [_noop]


func _unhandled_input(event: InputEvent) -> void:
	_callback_stack.back().call(event)


func register_input_callback(callback: Callable) -> void:
	_callback_stack.append(callback)


func pop_stack() -> void:
	_callback_stack.pop_back()


func reset() -> void:
	_callback_stack = [_noop]


func _noop(_event: InputEvent) -> void:
	pass
