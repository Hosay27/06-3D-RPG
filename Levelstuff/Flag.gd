extends StaticBody

onready var Spawn = get_node_or_null("/root/Game/Spawn")

func _ready():
	$Idle.show()
	$Set.hide()

func _on_Area_body_entered(body):
	if body.name == "Player":
		$Idle.hide()
		$Set.show()
		Spawn.global_transform = global_transform
