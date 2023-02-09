extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bounciness = 250 #this really aughtta connect to the physics material now that that's how bouncing is handled
export var points = 10
onready var scoreboard = get_node("/root/Node2D/Camera2D/Scoreboard")



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = 0
	$AnimationPlayer.stop(true)
	# $AnimationPlayer.play("bump")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _physics_process(delta):

# 	pass

# func _integrate_forces(state):
	# thought I'd need to manually hold a rigidbody in place because Static won't register collisions,
	# but it turns out we can just make it Kinematic
	# state.set_linear_velocity (Vector2 (0, 0))
	# state.set_angular_velocity (0)
	# pass


func _on_RigidBody2D_body_entered(body:Node):
	# print_debug("ping " + body.name)
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play("bump")
	$AnimatedSprite.frame = 1

	if body is RigidBody2D && body.name == "VeggieBody2D":
		scoreboard._on_add_score(points)

		# so this was all to deflect the vegeteball, but it turns out you can just turn up the bounciness on the physics material so it's unnecessary
		# --------------------------------------------------------------------------------------------
		# print_debug(body.linear_velocity.normalized())
		# var incoming_velocity = body.linear_velocity.normalized()
		# body.set_deferred("linear_velocity", incoming_velocity + (incoming_velocity * bounciness))
		# --------------------------------------------------------------------------------------------
	
	pass # Replace with function body.
