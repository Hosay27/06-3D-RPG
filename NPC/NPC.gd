extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialouge")
var time = 1
var time1 = 0

var dialogue = [
	"Hello",
	"How are you?",
	"You're Gay",
	"asdaskdljaldjlkajwdpqwiuhghvcbqxwxklqwjxjqwkld qwjdkljkqldjqkldjqd qdqkjldjqldjqldaodx"
]

func _ready():
	Dialogue.connect("finished_dialouge", self,"finished")
	$AnimationTree.set("parameters/Idle_Change/blend_amount", 0)
	$Timer.start()

func _on_Area_body_entered(body):
	if body.name == "Player":
		Dialogue.start_dialouge(dialogue)

func _on_Area_body_exited(body):
	if body.name == "Player":
		Dialogue.hide_dialouge()

func finished():
	queue_free()

func _on_Timer_timeout():
	time -= .1
	$AnimationTree.set("parameters/Idle_Change/blend_amount", 1)
	$Timer2.start()

func _on_Timer2_timeout():
	$AnimationTree.set("parameters/Idle_Change/blend_amount", 0)
