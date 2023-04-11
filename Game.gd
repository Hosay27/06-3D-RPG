extends Spatial

onready var Spawn = $Spawn

func _ready():
	var player = preload("res://Player/Player.tscn").instance()
	player.name = "Player"
	player.global_transform = Spawn.global_transform
	add_child(player)


func _on_Forest_area_shape_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://Levels/Forest.tscn")

func _on_Main_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://Levels/Main_Area.tscn")
