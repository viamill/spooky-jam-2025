extends Door


func interact() -> void:
	door_open.play()
	door_knock.stop()


func haunt() -> void:
	door_knock.play()
