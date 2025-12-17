extends Node2D

var linear_velocity
var angular_velocity
var sleeping

@onready var respawn_location: Vector2 = Vector2(-160,-99)

func _respawn():
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0
	global_position = respawn_location
	sleeping = false
