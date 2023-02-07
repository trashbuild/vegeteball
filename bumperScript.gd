extends Node2D
# signal add_score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bounciness = 250
export var points = 10
var scoreboard


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = 0
	scoreboard = get_node("/root/Node2D/Camera2D/Scoreboard")
	# scoreboard.connect("add_score", scoreboard, "_on_add_score")
	# $CollisionPolygon2D.connect("body_entered", self, "_on_RigidBody2D_body_entered")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _physics_process(delta):

# 	pass



# func _on_Rutabaga_hit():
# 	$AnimatedSprite.frame = 0
# 	pass # Replace with function body

func _integrate_forces(state):
	# state.set_linear_velocity (Vector2 (0, 0))
	state.set_angular_velocity (0)


func _on_RigidBody2D_body_entered(body:Node):
	# print_debug("ping " + body.name)
	$AnimatedSprite.frame = 1
	# emit_signal("add_score", points)
	if body is RigidBody2D && body.name == "VeggieBody2D":
		scoreboard._on_add_score(points)
		# print_debug(body.linear_velocity.normalized())
		# var incoming_velocity = body.linear_velocity.normalized()
		# body.set_deferred("linear_velocity", incoming_velocity + (incoming_velocity * bounciness))

	# print_debug("10 points!")

	

	# body.set_deferred("linear_velocity", Vector2(-500,0))
	# body._integrate_forces()
	pass # Replace with function body.
