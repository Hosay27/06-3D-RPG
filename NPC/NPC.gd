extends KinematicBody

var dialogue = Dialogic.start("Npc")

func _on_Area_body_entered(body):
	if body.name == "Player":
		var dialogue = Dialogic.start("Npc")
		add_child(dialogue)
