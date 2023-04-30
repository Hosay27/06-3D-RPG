extends KinematicBody

onready var Bullet = load("res://Enemy/Bullet.tscn")
onready var hp = $Health/Viewport/Healthbar
onready var rc = $RayCast
onready var delay = $Shoot

enum {
	IDLE,
	ALERT,
	ATTACK,
	DEAD,
}

var state = IDLE
var target
var turn_speed = 2
var health = 5

func _physics_process(_delta):
	healthbar()
	match state:
		ALERT:
			$Eyes.look_at(target.global_transform.origin, Vector3.UP)
			rotate_y(deg2rad($Eyes.rotation.y * turn_speed))

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
		queue_free()

func _on_Sight_body_entered(body):
	if body.name == "Player":
		state = ALERT
		target = body
		delay.start()

func _on_Sight_body_exited(_body):
	state = IDLE
	delay.stop()

func _on_Shoot_timeout():
	if rc.is_colliding():
		var hit = rc.get_collider()
		if hit.is_in_group("Player"):
			var bullet = Bullet.instance()
			$Eyes.add_child(bullet)
			bullet.look_at(rc.get_collision_point(), Vector3.UP)
			bullet.shoot = true
			state = ALERT
