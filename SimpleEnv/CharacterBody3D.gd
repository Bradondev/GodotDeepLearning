extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var ai_controller = $AIController3D



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity.x = ai_controller.move.x
	velocity.z = ai_controller.move.y
	move_and_slide()


func _on_target_body_entered(body):
	position = Vector3(-3.5,.07,0)
	ai_controller.reward += 2


func _on_wall_body_entered(body):
	position = Vector3(-3.5,.07,0)
	ai_controller.reward -= 1
	ai_controller.reset()
