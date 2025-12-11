extends CharacterBody2D

var xdirection = 0
var xspeed = 100
var ydirection = 0
var yspeed = 100
var max_health: int = 10
var health: int = max_health
var damage_amount: int = 1
var timer = null

signal health_changed(new_health: float, max_health: float)
signal player_died

func _ready():
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_wait_time(0.01) # 0.25 is just an example. 
	add_child(timer)
	health = max_health
	collision_layer = 1

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		print("Something")
		area.apply_damage(damage_amount)
		print("Something4")

func take_damage(amount: float) -> bool:
	health -= amount
	print("Something1")
	health = max(0, health)
	print("Something2")
	health_changed.emit(health, max_health)
	print("Something3")

	if health <= 0:
		die()
		print("Something5")
		return true

	return false

func die() -> bool:
	print("you died!")
	player_died.emit()
	# Disable player controls
	set_physics_process(false)
	# Hide or play death animation
	visible = false

	return true

func _physics_process(_delta):
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
