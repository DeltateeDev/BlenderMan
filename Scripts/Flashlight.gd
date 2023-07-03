extends SpotLight3D

func _ready():
	self.light_energy = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		self.light_energy = 5 - self.light_energy
