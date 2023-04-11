extends KinematicBody

onready var Camera = $Pivot/Camera
onready var Pivot = $Pivot

var velocity = Vector3()
var gravity = -9.8
var speed = 0.4
var max_speed = 6
var jump_power = 10

var mouse_sensitivity = 0.002

func _physics_process(_delta):
	show()
	print(Global.health)
	velocity.y += gravity * _delta
	var falling = velocity.y
	velocity.y = 0

	var desired_velocity = get_input() * speed
	if desired_velocity.length():
		velocity += desired_velocity
	else:
		velocity *= 0.9
	var current_speed = velocity.length()
	velocity = velocity.normalized() * clamp(current_speed,0,max_speed)
	velocity.y = falling
	jump()
	velocity = move_and_slide(velocity,Vector3.UP,true)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		Pivot.rotate_x(event.relative.y * mouse_sensitivity)
		Pivot.rotation_degrees.x = clamp(Pivot.rotation_degrees.x, -30, 15)

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

func Hit(d):
	if $Invincible.is_stopped():
		$Invincible.start()
		Global.update_health(d)
		$Effect.play("Flash")
		if Global.health <= 0:
			get_tree().quit()

func _on_Invincible_timeout():
	$Effect.play("Normal")
