extends Control

var healing = 0.006

func _physics_process(_delta):
	update_score()
	update_health()
	update_coins()
	if $Damage.color.a > 0:
		$Damage.color.a -= healing

func add_damage(d):
	$Damage.color.a = clamp($Damage.color.a + d, 0, 1)

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_coins():
	$Coins.text = "x " + str(Global.coins)

func update_health():
	$Healthbar.value = int(Global.health)
	if $Healthbar.value > 10:
		$Healthbar.tint_progress = Color8(0,255,0)
	elif $Healthbar.value <= 10 and $Healthbar.value > 5:
		$Healthbar.tint_progress = Color8(255,255,0)
	elif $Healthbar.value <= 5:
		$Healthbar.tint_progress = Color8(255,0,0)
