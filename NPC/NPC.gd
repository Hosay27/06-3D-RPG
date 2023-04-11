extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialouge")
	
var dialogue = [
	"Hello",
	"How are you?",
	"You're Gay",
	"asdaskdljaldjlkajwdpqwiuhghvcbqxwxklqwjxjqwkld qwjdkljkqldjqkldjqd qdqkjldjqldjqldaodx"
]

func _ready():
	Dialogue.connect("finished_dialouge", self,"finished")

func _on_Area_body_entered(body):
	if body.name == "Player":
		Dialogue.start_dialouge(dialogue)

func _on_Area_body_exited(body):
	if body.name == "Player":
		Dialogue.hide_dialouge()

func finished():
	queue_free()
