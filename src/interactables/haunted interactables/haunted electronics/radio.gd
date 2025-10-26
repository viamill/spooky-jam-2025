extends ElectronicInteractable


@onready var audio_stream_player: AudioStreamPlayer3D = $AudioStreamPlayer3D


func interact() -> void:
	if audio_stream_player.playing:
		audio_stream_player.stop()
	else:
		audio_stream_player.play()


func haunt() -> void:
	if audio_stream_player.playing:
		audio_stream_player.stop()
	else:
		audio_stream_player.play()
