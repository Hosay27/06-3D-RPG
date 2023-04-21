extends KinematicBody

onready var hp = $Health/Viewport/Healthbar

var radius = 50
var angle = 0
var health = 6
var damage = 1
export var height = 15
export var speed = 8

func _ready():
	angle = randf() * 2 * PI
	new_position(angle)

func _physics_process(_delta):
	healthbar()

func new_position(a):
	var pos = Vector3(0, height, 0)
	pos.x = radius * cos(a)
	pos.z = radius * sin(a)
	look_at(pos,Vector3(0,height,0))
	$Tween.interpolate_property(self, "global_transform:origin", global_transform.origin, pos, speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func Hit(d):
	health -= d
	if health <= 0:
		Global.update_score(100)
		queue_free()

func healthbar():
	hp.value = health
	if hp.value > 4:
		hp.tint_progress = Color8(0,255,0)
	elif hp.value <= 4 and hp.value > 2:
		hp.tint_progress = Color8(255,255,0)
	elif hp.value <= 2:
		hp.tint_progress = Color8(255,0,0)

func _on_Tween_tween_all_completed():
	angle += PI/2 + (randf() * (PI/2))
	angle = wrapf(angle, 0, 2*PI)
	new_position(angle)


func _on_Area_body_entered(body):
	if body.name == "Player":
		body.Hit(damage)
