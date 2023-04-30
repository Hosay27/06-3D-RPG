extends KinematicBody

var first = true

func _physics_process(delta):
	$AnimationPlayer.play("Normal")

func interact():
	if first:
		var dialogue = Dialogic.start("NPC")
		add_child(dialogue)
