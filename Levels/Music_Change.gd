extends Area



func _on_Music_Change_body_entered(body):
	var music = get_node_or_null("/root/Game/Music")
	var music2 = get_node_or_null("/root/Game/Music2")
	if body.name == "Player":
		if music.is_playing():
			music.stop()
			music2.play()
		elif music2.is_playing():
			music2.stop()
			music.play()
