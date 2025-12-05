extends CharacterBody2D

var xdirection = 0
var xspeed = 100
var ydirection = 0
var yspeed = 100
var max_health: int = 10
var health: int = max_health

func _physics_process(delta: float) -> void:
	if xdirection:
		velocity.x = xdirection * xspeed
	else:
		velocity.x = move_toward(velocity.x, 0, xspeed)
		
	if ydirection:
		velocity.y = ydirection * yspeed
	else:
		velocity.y = move_toward(velocity.y, 0, yspeed)
		
	xdirection = Input.get_axis("ui_right", "ui_left")
	ydirection = Input.get_axis("ui_up", "ui_down")
	move_and_slide()
