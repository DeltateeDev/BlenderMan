extends StaticBody3D

var blenderman_aggression: int = 0

func _ready():
	Globals.blenderman = self
	
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	pass 

#goals:
#on page pickup: aggression is getting higher
#every timer timeout (which is lower with each aggression level) blenderman teleports a set distance
#towards the player, trying to reach their position
#if the player's standing in place for more than 10 seconds, the aggression level hits 4 (max)
#if Blenderman is close to the player, the player cannot move and the camera rotates towards him
#game over

#issues that won't be addressed since I'm not releasing the game:
#blenderman will be able to teleport inside of objects
