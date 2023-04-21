extends KinematicBody

onready var Camera = $Pivot/Camera
onready var Pivot = $Pivot
onready var animation = $AnimationPlayer

var interaction = null
var velocity = Vector3()
var gravity = -12
var speed = 0.4
var max_speed = 6
var jump_power = 10
var damage = 1

var mouse_sensitivity = 0.002
var target = null

func _physics_process(_delta):
	show()
	#print(Global.health)
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
	if not $AnimationPlayer.is_playing() and is_on_floor():
		$AnimationTree.active = true
		$AnimationTree.set("parameters/Idle_Run/blend_amount",current_speed/max_speed)
	jump()
	velocity = move_and_slide(velocity,Vector3.UP,true)
	
	if Input.is_action_just_pressed("talk"):
		interact()
	
	if Input.is_action_pressed("Run"):
		speed = 0.9
		max_speed = 15
	else:
		speed = 0.4
		max_speed = 6

	if Input.is_action_just_pressed("Shoot") and target != null and target.is_in_group("Enemy"):
		var shoot = get_node_or_null("/root/Game/Sounds/Shoot")
		if shoot != null:
			shoot.play()
		$AnimationTree.active = false
		$AnimationPlayer.playback_speed = 2
		$AnimationPlayer.play("Shoot")
		target.Hit(damage)

	if global_transform.origin.y <= -10:
		queue_free()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		Pivot.rotate_x(event.relative.y * mouse_sensitivity)
		Pivot.rotation_degrees.x = clamp(Pivot.rotation_degrees.x, -30, 30)


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

func interact():
	if interaction.is_in_group("Interact"):
#	if interaction != null:
#		if interaction.has_method("interact"):
		interaction.interact()

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power
		$AnimationTree.active = false
		$AnimationPlayer.playback_speed = .8
		$AnimationPlayer.play("Jump")
		var sound = get_node_or_null("/root/Game/Sounds/Jump")
		if sound != null:
			sound.play()

func Hit(d):
	if $Invincible.is_stopped():
		$Invincible.start()
		Global.update_health(d)
		get_node("/root/Game/UI/HUD").add_damage(0.5)
		animation.play("Flash")
		if Global.health <= 0:
			Global.health = 10
			queue_free()

func _on_Invincible_timeout():
	animation.play("Normal")


func _on_Interact_body_entered(body):
	interaction = body
