extends AIController2D


var move =0

@export var cube : Area2D
@onready var target = $"../../Area2D"



func get_obs() -> Dictionary:

	var obs := [
		cube.position.x,
		target.position.x,
	]
	return {"obs":obs}

func get_reward() -> float:
	return reward
func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
	}

func set_action(action) -> void:

	move = action["move"][1]
	print(move)
