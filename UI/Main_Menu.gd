extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Levelstuff/Main_Area.tscn")

func _on_Quit_pressed():
	get_tree().quit()
