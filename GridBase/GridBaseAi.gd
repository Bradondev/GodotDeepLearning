extends AIController2D


var move = InputEvent

@export var cube : Area2D
@onready var target = $"../../target"



func get_obs() -> Dictionary:
	print(cube.position.x)
	var obs := [
		cube.position.x,
		cube.position.y,
		target.position.x,
		target.position.y
	]
	return {"obs":obs}

func get_reward() -> float:
	return reward
func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "discrete"
		},
	}

func set_action(action) -> void:
	move =  clamp(action["move"][0], -1.0, 1.0)
