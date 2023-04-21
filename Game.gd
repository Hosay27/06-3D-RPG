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
		Global.health = 10
		var player = Player.instance()
		player.name = "Player"
		player.global_transform = Spawn.global_transform
		add_child(player)
