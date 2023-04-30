extends RigidBody

var shoot = false
var speed = 5
var damage = 1

func _ready():
	set_as_toplevel(true)

func _physics_process(_delta):
	if shoot:
		$Timer.start()
		apply_impulse(transform.basis.z, -transform.basis.z)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		body.Hit(damage)
		queue_free()
	elif !body.is_in_group("Enemy"):
		queue_free()

func _on_Timer_timeout():
	queue_free()
