extends Spatial
onready var Player = preload("res://Player/Player.tscn")
onready var Spawn = $Spawn

func _ready():
	var player = Player.instance()
	player.name = "Player"
	player.global_transform = Spawn.global_transform
	add_child(player)

func _physics_process(_delta):
	if not has_node("Player"):
		var player = Player.instance()
		player.name = "Player"
		player.global_transform = Spawn.global_transform
		add_child(player)

func _on_Main_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://Levels/Main_Area.tscn")


func _on_Forest_body_entered(body):
	if body.name == "Player":
		var _scene = get_tree().change_scene("res://Levels/Forest.tscn")
