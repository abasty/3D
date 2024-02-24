extends Node

# @onready var mesh = $MeshInstance3D

@onready var camera = $Camera3D
@onready var anim_player : AnimationPlayer = $AnimationPlayer

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_A && event.pressed:
			anim_player.play("move")
		elif event.keycode == KEY_Z && event.pressed:
			anim_player.play("spin")
		elif event.keycode == KEY_E && event.pressed:
			anim_player.play("jump")
		elif event.keycode == KEY_SPACE && event.pressed:
			anim_player.pause()
		elif event.keycode == KEY_ESCAPE && event.pressed:
			anim_player.stop()

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.look_at(Vector3(0, 0, 0))
	# load your image.
	# var image = load("res://media/fighter/cinfa.jpg")
	# # Get the 3D model
	# var mesh = get_node("MeshInstance3D")
	# mesh.create_debug_tangents()
	# # Get a duplicate material of the material in slot 0
	# # (New code below!)
	# var mat = mesh.get_active_material(0)
	# # var mat = mesh.get_surface_override_material(0)
	# var material_one = mat.duplicate()
	# # Change the texture
	# material_one.albedo_texture = image
	# # Reassign the material
	# mesh.set_surface_override_material(0, material_one)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
