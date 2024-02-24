extends Node3D

const delta = 2

@onready var camera = $Camera
@onready var light = $Light
@onready var camera_azimuth = 0

# Add input handling
func _input(event):
	var camera_last_azimuth = camera_azimuth
	if event is InputEventKey:
		if event.keycode == KEY_LEFT && event.pressed:
			camera_azimuth -= delta
		elif event.keycode == KEY_RIGHT && event.pressed:
			camera_azimuth += delta
		if event.keycode == KEY_UP && event.pressed:
			camera.position.y += delta
		elif event.keycode == KEY_DOWN && event.pressed:
			camera.position.y -= delta
			
		if camera_azimuth != camera_last_azimuth:
			camera.position.x = cos(deg_to_rad(camera_azimuth)) * 50
			camera.position.z = sin(deg_to_rad(camera_azimuth)) * 50
		camera.look_at(Vector3(0, 0, 0))

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.look_at(Vector3(0, 0, 0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
