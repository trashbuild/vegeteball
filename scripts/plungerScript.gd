extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var pull_strength = 100
export var launch_strength_base = 100
export var launch_strength_cap = 700
onready var launch_strength = launch_strength_base

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _physics_process(delta):
# 	# var velocity = Vector2.ZERO

# 	pass

func _integrate_forces(state):
	var vel = state.get_linear_velocity ()
	if Input.is_action_pressed("plunger"):
		# velocity.y -=10
		# set_axis_velocity(Vector2(0,-2))
		vel.y += pull_strength;
		launch_strength = lerp(launch_strength, launch_strength_cap, get_physics_process_delta_time())
	if Input.is_action_just_released("plunger"):
		vel.y -= launch_strength;
		print_debug(launch_strength)
		launch_strength = launch_strength_base
	state.set_linear_velocity (Vector2 (-vel.x, vel.y))
	# set_axis_velocity(Vector2(0,vel.y))
	state.set_angular_velocity (0)

