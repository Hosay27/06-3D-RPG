extends KinematicBody

var idle = true
var first = true

func _physics_process(delta):
	if idle:
		$AnimationPlayer.play("Normal")
		$Timer.start()

func interact():
	if first:
		var dialogue = Dialogic.start("NPC")
		add_child(dialogue)


func _on_Timer_timeout():
	idle = false
	$AnimationPlayer.play("Idle1")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Idle1":
		idle = true
