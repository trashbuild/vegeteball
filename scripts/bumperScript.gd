extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bounciness = 250 #this really aughtta connect to the physics material now that that's how bouncing is handled
export var points = 10
onready var scoreboard = get_node("/root/Main/Camera2D/Scoreboard")
var bumper_brightness = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.material.set_shader_param("u_bumper_brightness", bumper_brightness)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if bumper_brightness > 0:
		bumper_brightness-=0.5*bumper_brightness*bumper_brightness
	$AnimatedSprite.material.set_shader_param("u_bumper_brightness", bumper_brightness)
	pass

# func _integrate_forces(state):
	# thought I'd need to manually hold a rigidbody in place because Static won't register collisions,
	# but it turns out we can just make it Kinematic
	# state.set_linear_velocity (Vector2 (0, 0))
	# state.set_angular_velocity (0)
	# pass


func _on_RigidBody2D_body_entered(body:Node):
	$AnimatedSprite.frame = 1
	bumper_brightness = 1
	if body is RigidBody2D && body.get_parent().name == "veggies":
		scoreboard._on_add_score(points)

		# so this was all to deflect the vegeteball, but it turns out you can just turn up the bounciness on the physics material so it's unnecessary
		# --------------------------------------------------------------------------------------------
		# print_debug(body.linear_velocity.normalized())
		# var incoming_velocity = body.linear_velocity.normalized()
		# body.set_deferred("linear_velocity", incoming_velocity + (incoming_velocity * bounciness))
		# --------------------------------------------------------------------------------------------
	
	pass # Replace with function body.
