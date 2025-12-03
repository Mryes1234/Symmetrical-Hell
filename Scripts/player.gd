extends CharacterBody2D

var xdirection = 0
var xspeed = 100
var ydirection = 0
var yspeed = 100

func _ready():
	pass

func _physics_process(delta):
	if xdirection:
		velocity.x = xdirection * xspeed
	else:
		velocity.x = move_toward(velocity.x, 0, xspeed)
		
	if ydirection:
		velocity.y = ydirection * yspeed
	else:
		velocity.y = move_toward(velocity.y, 0, yspeed)
		
	xdirection = Input.get_axis("ui_left", "ui_right")
	ydirection = Input.get_axis("ui_up", "ui_down")
	move_and_slide()
