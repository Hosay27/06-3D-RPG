extends Area

var damage = 1

func _on_Spike_body_entered(body):
	if body.name == "Player":
		body.Hit(damage)
