extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = 0
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
	print_debug("ping " + body.name)
	$AnimatedSprite.frame = 1
	pass # Replace with function body.
