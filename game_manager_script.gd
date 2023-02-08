extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_speedzone_body_entered(body:Node):
	if body is RigidBody2D && body.name == "VeggieBody2D":
		print_debug(body.linear_velocity)
		var vel = body.linear_velocity
		body.set_deferred("linear_velocity", vel * $speedzone.boost_multiplier)
	pass # Replace with function body.
