extends Node2D
# signal hit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# var killzone
# var scoreboard
# var rigidBody


# Called when the node enters the scene tree for the first time.
func _ready():
	# killzone = get_node("/root/Main/killzone")
	# scoreboard = get_node("/root/Main/Camera2D/Scoreboard")
	# scoreboard._veggie_update(1)
	# rigidBody = $VeggieBody2D

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	# if killzone.overlaps_body($RigidBody2D):
	# if killzone.body_entered(rigidBody):
		# print_debug("ded")
		# scoreboard._veggie_update(-1)
		# self.destroy???idk
	pass

func _integrate_forces(_state):
	pass

# func _on_RigidBody2D_body_entered(body):
	# emit_signal("hit")
	# print_debug("pang " + body.name)
	# pass # Replace with function body.


# func _on_speedzone_body_entered(_body:Node, boost_multiplier):
# 	var vel = rigidBody.get_linear_velocity
# 	vel *= boost_multiplier
# 	rigidBody.set_deferred("linear_velocity",vel)
	pass # Replace with function body.
