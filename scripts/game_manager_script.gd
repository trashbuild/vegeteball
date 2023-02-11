extends Node
signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var veggie_count = 5
var new_vegetaball_ready = false
var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():

	start_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_action_just_pressed("restart"):
		start_game()
	if Input.is_action_just_pressed("tilt"):
		print_debug("TILT")
		#TODO: figure out how THAT's gonna work...
	if Input.is_action_pressed("plunger"):
		
		if new_vegetaball_ready == true:
			new_vegetaball_ready = false
			$veggies.spawn_veggie()
			pass
		if game_over:
			game_over = false
			start_game()
	pass


func _on_speedzone_body_entered(body:Node):
	if body is RigidBody2D && body.get_parent().name == "veggies":
		print_debug(body.linear_velocity)
		var vel = body.linear_velocity
		body.set_deferred("linear_velocity", vel * $speedzone.boost_multiplier)
	pass # Replace with function body.



func start_game():
	for i in $veggies.get_children():
		i.queue_free()
	$Camera2D/Scoreboard.veggie_count = veggie_count
	$Camera2D/Scoreboard.score = 0
	$veggies.veggie_count = veggie_count
	$veggies.new_game()
	
	# if $veggies.NOTIFICATION_READY:
	# 	$veggies.spawn_veggie()
		
	pass


func _on_killzone_body_entered(body:Node):
	if body.get_parent().name == "veggies":
		$Camera2D/Scoreboard._veggie_update(-1)
		new_vegetaball_ready = true
	if $Camera2D/Scoreboard.veggie_count <= 0:
		self.emit_signal("game_over")
		print_debug("game over")
	pass # Replace with function body.


func _on_Main_game_over(): 
	game_over = true

	pass # Replace with function body.
