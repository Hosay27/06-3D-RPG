extends Control

var healing = 0.006

func _physics_process(_delta):
	update_score()
	update_health()
	if $Damage.color.a > 0:
		$Damage.color.a -= healing

func add_damage(d):
	$Damage.color.a = clamp($Damage.color.a + d, 0, 1)

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_health():
	$Healthbar.value = int(Global.health)
	if $Healthbar.value > 7:
		$Healthbar.tint_progress = Color8(0,255,0)
	elif $Healthbar.value <= 6 and $Healthbar.value > 4:
		$Healthbar.tint_progress = Color8(255,255,0)
	elif $Healthbar.value <= 3:
		$Healthbar.tint_progress = Color8(255,0,0)
