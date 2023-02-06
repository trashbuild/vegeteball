extends Node2D
# signal hit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var killzone
var scoreboard
var rigidBody


# Called when the node enters the scene tree for the first time.
func _ready():
	killzone = get_node("/root/Node2D/killzone")
	scoreboard = get_node("/root/Node2D/Camera2D/Scoreboard")
	scoreboard._veggie_update(1)
	rigidBody = $RigidBody2D

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
