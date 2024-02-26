extends Node3D

const camera_speed = 40

@onready var camera : Camera3D = $Camera
@onready var camera_azimuth := 0.0
# @onready var light : DirectionalLight3D = $Light

func _ready() -> void:
	camera.look_at(Vector3(0, 0, 0))
# end func _ready

func _process(delta: float) -> void:
	var camera_last_azimuth := camera_azimuth
	var camera_last_prosition_y := camera.position.y

	if Input.is_key_pressed(KEY_LEFT):
		camera_azimuth -= camera_speed * delta
	# end if

	if Input.is_key_pressed(KEY_RIGHT):
		camera_azimuth += camera_speed * delta
	# end if

	if Input.is_key_pressed(KEY_UP):
		camera.position.y += camera_speed * delta
	# end if

	if Input.is_key_pressed(KEY_DOWN):
		camera.position.y -= camera_speed * delta
	# end if

	if camera_azimuth != camera_last_azimuth:
		camera.position.x = cos(deg_to_rad(camera_azimuth)) * 50
		camera.position.z = sin(deg_to_rad(camera_azimuth)) * 50
	# end if

	if camera.position.y != camera_last_prosition_y or camera_azimuth != camera_last_azimuth:
		camera.look_at(Vector3(0, 0, 0))
	# end if

# end func _process
