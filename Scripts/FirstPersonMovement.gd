extends CharacterBody3D

@onready var neck: Node3D = $Neck
@onready var camera: Camera3D = $Neck/PlayerPOV

@export var speed: float = 1.5
@export var sprint_speed: int = 3
@export var gravity: int = 15
@export var jump_strength: int = 5
@export var acceleration: int = 10
@export var mouse_sensitivity: float = 0.0025

var move_direction: Vector3 = Vector3.ZERO


func _ready():
	Globals.player = self

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	
func _unhandled_input(event: InputEvent):
	
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * mouse_sensitivity)
			camera.rotate_x(-event.relative.y * mouse_sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func handle_movement(delta):
	if Input.is_action_pressed("sprint"):
		speed = sprint_speed
	else:
		speed = 1.5
	move_direction = Vector3(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0, Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")).normalized().rotated(Vector3.UP, neck.rotation.y)
	if !is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_pressed("jump"):
		velocity.y = jump_strength
	
	velocity.x = lerp(velocity.x, move_direction.x * speed, acceleration * delta)
	velocity.z = lerp(velocity.z, move_direction.z * speed, acceleration * delta)
	
	move_and_slide()

