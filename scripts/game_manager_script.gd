extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var veggie_count = 5
var new_vegetaball_ready = false

# Called when the node enters the scene tree for the first time.
func _ready():

	start_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_action_just_pressed("tilt"):
		print_debug("TILT")
		#TODO: figure out how THAT's gonna work...
	pass


func _on_speedzone_body_entered(body:Node):
	if body is RigidBody2D && body.name == "VeggieBody2D":
		print_debug(body.linear_velocity)
		var vel = body.linear_velocity
		body.set_deferred("linear_velocity", vel * $speedzone.boost_multiplier)
	pass # Replace with function body.

func start_game():
	$Camera2D/Scoreboard.veggies = veggie_count
	
	if $veggies.ready:
		$veggies.spawn_veggie()
		
	pass
