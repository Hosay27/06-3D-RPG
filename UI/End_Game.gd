extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Label.text = "Thanks for Playing! Your score was: " + str(Global.score)

func _on_Quit_pressed():
	get_tree().quit()
