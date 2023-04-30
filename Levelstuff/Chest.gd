extends StaticBody

onready var Coin = load("res://Levelstuff/Coin.tscn")
var closed = true

func interact():
	if closed:
		closed = false
		var coin = Coin.instance()
		coin.global_transform = global_transform
		add_child(coin)
		
		coin.global_transform = global_transform
		add_child(coin)
		
		coin.global_transform = global_transform
		add_child(coin)
