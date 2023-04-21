extends KinematicBody

func interact():
	var dialogue = Dialogic.start("Npc")
	add_child(dialogue)
