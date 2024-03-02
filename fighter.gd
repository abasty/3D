extends CharacterBody3D

@export var pitch_speed := 1.5
@export var roll_speed := 1.9
@export var yaw_speed := 1.25
@export var max_speed := 50.0
@export var acceleration := 0.6
@export var input_response := 8.0

var forward_speed := 0.0
var pitch_input := 0.0
var roll_input := 0.0
var yaw_input := 0.0

func get_input(delta: float) -> void:
	if Input.is_action_pressed("throttle_up"):
		forward_speed = lerp(forward_speed, max_speed, acceleration * delta)
	if Input.is_action_pressed("throttle_down"):
		forward_speed = lerp(forward_speed, 0.0, acceleration * delta)

	pitch_input = lerp(pitch_input, Input.get_axis("pitch_down", "pitch_up"), input_response * delta)
	roll_input = lerp(roll_input, Input.get_axis("roll_right", "roll_left"), input_response * delta)
	yaw_input = lerp(yaw_input, Input.get_axis("yaw_right", "yaw_left"), input_response * delta)
	# yaw_input = -roll_input
	roll_input = -yaw_input

func _physics_process(delta: float) -> void:
	get_input(delta)
	velocity = transform.basis.x * forward_speed
	transform.basis = transform.basis.rotated(transform.basis.z, pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x, roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.orthonormalized()
	move_and_collide(velocity * delta)
