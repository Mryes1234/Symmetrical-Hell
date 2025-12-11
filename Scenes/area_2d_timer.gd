extends Area2D


func _on_damage_timer_timeout():
	var bodies = $DamageArea2D.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("take_damage"):
			body.take_damage(5)

@onready var timer = get_node("player/timer")

func on_area_body_enter(body):
	timer.start()

func on_area_body_exit(body):
	timer.stop()
