extends Area

func _physics_process(_delta):
	rotation_degrees.y += 5

func _on_Coin_body_entered(body):
	if body.is_in_group("Player"):
		var sound = get_node_or_null("/root/Game/Sounds/Coin")
		if sound != null:
			sound.play()
		Global.update_coins(1)
		queue_free()
