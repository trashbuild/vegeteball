extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var loc1 = Vector2(400,160)
export var loc2 = Vector2(400,300)
export var speed = 1.0
var zone
var camera_target = loc1

# Called when the node enters the scene tree for the first time.
func _ready():
	zone = get_node("/root/Node2D/camera_pan_up_zone")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#I think I need to check for collision elsewhere and just set a bool here, the zone.overlap thing isn't working out for some reason
	# if zone.overlaps_body(body):
		# print_debug("cameraaaa")
	transform.origin = lerp(transform.get_origin(),camera_target,speed*delta)
	# else:
		# transform.origin = lerp(transform.get_origin(),loc1,speed*delta)
	# pass



func _on_camera_pan_up_zone_body_entered(body:Node):
	print_debug("oops, there's a " + body.name + " up here")
	# if body.name == "VeggieBody2D":
	if body.get_parent().get_parent().name == "veggies":
		camera_target = loc2
	pass # Replace with function body.

func _on_camera_pan_up_zone_body_exited(body:Node):
	print_debug("oops, there's a " + body.name + " up here")
	# if body.name == "VeggieBody2D":
	if body.get_parent().get_parent().name == "veggies":
		camera_target = loc1
	pass # Replace with function body.
