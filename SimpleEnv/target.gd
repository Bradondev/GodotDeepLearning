extends Area3D

var temp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if event.is_action_pressed("ui_down"):
		position = Vector3(0,-1,3.5)
		if temp ==1 :
			position = Vector3(2.7,-1,3.5)
		if temp ==2 :
			position = Vector3(2.7,-1,3.5)
		if temp ==3:
			position = Vector3(2.7,-1,.5)
		if temp ==4:
			position = Vector3(2.7,-1,-3.5)
		if temp ==5:
			position = Vector3(0,-1,-3.5)

		temp +=1


