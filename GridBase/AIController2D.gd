extends AIController2D


var move =Vector2.ZERO
var jump = false

@export var cube : Node2D
@export var target : Area2D



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
			"size": 1,
			"action_type": "continuous"
		},
		"jump" : {
			"size": 1,
			"action_type": "continuous"
		},
	}

func set_action(action) -> void:
	jump =  action["jump"][0] > 0
	move.x = action["move"][0]
	print(move)
