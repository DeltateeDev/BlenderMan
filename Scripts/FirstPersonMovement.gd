extends CharacterBody3D

@export var speed: int = 20
var position_change: Vector3 = Vector3.ZERO

func _ready():
	pass


func _process(delta):
	if Input.is_action_pressed("move_forward"):
		position_change.z = -(speed * delta)
	elif Input.is_action_pressed("move_back"):
		position_change.z = (speed * delta)
	elif Input.is_action_pressed("move_left"):
		position_change.x = -(speed * delta)
	elif Input.is_action_pressed("move_right"):
		position_change.x = (speed * delta)
	else:
		position_change.x = 0
		position_change.z = 0
	
	self.position += position_change
