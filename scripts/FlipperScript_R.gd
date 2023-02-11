extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var startRotation
var endRotation
export var travelLength = 90
export var flipSpeed = 2



# Called when the node enters the scene tree for the first time.
func _ready():
	flipSpeed *= 360
	startRotation = get_rotation_degrees()
	endRotation = startRotation - travelLength
	# print_debug(startRotation)
	# print_debug(endRotation)


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("flipper_right"):
		# add_torque(10)
		if rotation_degrees >= endRotation:
			rotation_degrees -= flipSpeed * delta
	else:
		if rotation_degrees <= startRotation:
			rotation_degrees += flipSpeed * delta
	pass
