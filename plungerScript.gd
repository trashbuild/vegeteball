extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# var velocity = Vector2.ZERO

	pass

func _integrate_forces(state):
	var vel = state.get_linear_velocity ()
	if Input.is_action_pressed("plunger"):
		# velocity.y -=10
		# set_axis_velocity(Vector2(0,-2))
		vel.y += 100;

	state.set_linear_velocity (Vector2 (0, vel.y))
	state.set_angular_velocity (0)

