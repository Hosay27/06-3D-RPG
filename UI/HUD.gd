extends Control


func _physics_process(_delta):
	update_score()

func update_score():
	$Score.text = "Score: " + str(Global.score)
