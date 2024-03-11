extends Area2D
@onready var ray = $RayCast2D
@onready var ai_controller = $AIController2D
var ev = InputEventAction.new()
@export var tile_size = 64
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2



func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			print("is moving")

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size






func _on_timer_timeout():
	if  ai_controller.move >= 0:

		if  ai_controller.move <= .25:
			ev.action = "right"
			ai_controller.reward += 1
		elif  ai_controller.move <= .50:
			ev.action = "up"
		elif  ai_controller.move <= .75:
			ev.action ="left"
		elif  ai_controller.move >= .75:
			ai_controller.reward -= 1
			ev.action ="down"
		ev.pressed = true
		_unhandled_input(ev)
	else :
		ai_controller.reward -= 1


func _on_area_2d_area_entered(area):
	ai_controller.reward += 4
	position = Vector2(350,350)





func _on_wall_area_entered(area):
	ai_controller.reward -= 1
	ai_controller.reset()
	print("reset")
	position = Vector2(350,350)
