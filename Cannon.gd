extends StaticBody

onready var Bullet = load("res://Enemy/Bullet.tscn")
onready var shoot = true
onready var hp = $Health/Viewport/Healthbar

export var impulse = Vector3()

var health = 5

func _ready():
	pass

func _physics_process(_delta):
	healthbar()
	if shoot:
		shoot = false
		$Shoot.start()
		var bullet = Bullet.instance()
		$Nozzle.add_child(bullet)
		bullet.apply_impulse(impulse,-impulse)

func healthbar():
	hp.value = health
	if hp.value > 4:
		hp.tint_progress = Color8(0,255,0)
	elif hp.value <= 4 and hp.value > 2:
		hp.tint_progress = Color8(255,255,0)
	elif hp.value <= 2:
		hp.tint_progress = Color8(255,0,0)

func Hit(d):
	health -= d
	if health <= 0:
		Global.update_score(150)
		queue_free()

func _on_Shoot_timeout():
	shoot = true
