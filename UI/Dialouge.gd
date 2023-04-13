extends Control

var dialouge = []
var dialouge_pos = 0
var reveal_time = 1

signal finished_dialouge

func _physics_process(_delta):
	if dialouge.size() and dialouge_pos < dialouge.size():
		var d = "[center]" + dialouge[dialouge_pos] + "[/center]"
		if $Text.bbcode_text != d:
			$Text.bbcode_text = d
		if Input.is_action_just_pressed("talk"):
			$Text_speed.interpolate_property($Text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Text_speed.start()
			dialouge_pos += 1
	elif dialouge.size():
		emit_signal("finished_dialouge")
		hide_dialouge()

func _ready():
	hide()

func start_dialouge(d):
	dialouge = d.duplicate()
	dialouge_pos = 0
	$Text_speed.interpolate_property($Text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Text_speed.start()
	show()

func hide_dialouge():
	dialouge = []
	dialouge_pos = 0
	hide()
