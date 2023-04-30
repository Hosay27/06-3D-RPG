extends RigidBody

func _on_RollingSpike_body_entered(body):
	if body.name == "Player":
		body.Hit(1)
		queue_free()
	else:
		queue_free()

func _on_Timer_timeout():
	queue_free()
