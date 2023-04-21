extends Node

var menu = null
var score = 0
var health = 10

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func update_health(h):
	health = clamp(health - h, 0, 10)

func update_score(s):
	score += s

func reset():
	health = 10
	score = 0

func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		if menu == null:
			menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if menu.visible:
				menu.hide()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				get_tree().paused = false
			else:
				menu.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().paused = true
