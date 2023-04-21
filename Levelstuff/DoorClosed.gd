extends Area

var locked = true

func _ready():
	pass
 
func unlock():
	locked = false


func _on_DoorClosed_body_entered(body):
	if body.name == "Player" and locked == false:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
