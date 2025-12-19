extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is drop:
		_respawn_particle()
		print(body)
		body.queue_free()


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("A")

func _respawn_particle():
	var particle = preload("res://Scenes/particle.tscn").instantiate()
	particle.position = Vector2(randf_range(-190,190),-99)
	await get_tree().create_timer(randf_range(0.1,1)).timeout
	add_child(particle)
	
