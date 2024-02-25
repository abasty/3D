extends Node3D

const camera_speed = 4

@onready var camera : Camera3D = $Camera
@onready var light : DirectionalLight3D = $Light
@onready var camera_azimuth := 0

# Add input handling
func _input(event: InputEvent) -> void:
	var camera_last_azimuth := camera_azimuth
	if event is InputEventKey:
		if event.keycode == KEY_LEFT && event.pressed:
			camera_azimuth -= camera_speed
		elif event.keycode == KEY_RIGHT && event.pressed:
			camera_azimuth += camera_speed
		if event.keycode == KEY_UP && event.pressed:
			camera.position.y += camera_speed
		elif event.keycode == KEY_DOWN && event.pressed:
			camera.position.y -= camera_speed

		if camera_azimuth != camera_last_azimuth:
			camera.position.x = cos(deg_to_rad(camera_azimuth)) * 50
			camera.position.z = sin(deg_to_rad(camera_azimuth)) * 50
		camera.look_at(Vector3(0, 0, 0))

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.look_at(Vector3(0, 0, 0))

# Called every frame. 'camera_speed' is the elapsed time since the previous frame.
func _process(delta):
	pass
