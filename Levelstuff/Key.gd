extends Area

func _physics_process(delta):
	rotation_degrees.y += 3

func _on_Key_body_entered(body):
	if body.name == "Player":
		var sound = get_node_or_null("/root/Game/Sounds/Key")
		if sound != null:
			sound.play()
		var exit = get_node_or_null("/root/Game/Level/Door")
		if exit != null:
			exit.unlock()
			queue_free()
