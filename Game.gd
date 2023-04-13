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
		var music = get_node_or_null("/root/Game/Music")
		var music2 = get_node_or_null("/root/Game/Music2")
		music2.stop()
		music.play()
