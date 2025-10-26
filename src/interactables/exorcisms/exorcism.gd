extends Node3D

@onready var menus: Control = $"../Menus"


func _ready() -> void:
	hide()
	$DemonExorcism/CollisionShape3D.disabled = true
	$BansheeExorcism/CollisionShape3D.disabled = true
	$PoltergeistExorcism/CollisionShape3D.disabled = true


func reset() -> void:
	hide()
	$DemonExorcism/CollisionShape3D.disabled = true
	$BansheeExorcism/CollisionShape3D.disabled = true
	$PoltergeistExorcism/CollisionShape3D.disabled = true
	print('hello')

func start() -> void:
	show()
	$DemonExorcism/CollisionShape3D.disabled = false
	$BansheeExorcism/CollisionShape3D.disabled = false
	$PoltergeistExorcism/CollisionShape3D.disabled = false
	print(GameManager.cur_anomaly)
