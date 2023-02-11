extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array, PackedScene) var veggie_types = []
var veggie_list = []
# var ready = false
var veggie_count

# Called when the node enters the scene tree for the first time.
func _ready():
	# ready = true
	randomize()
	# veggie_list = veggie_types
	# veggie_count = veggie_list.size()
	pass # Replace with function body.

func new_game():
	
	for i in veggie_count:
		veggie_list.append(veggie_types[randi() % veggie_types.size()])
	print_debug(veggie_list)

	spawn_veggie()
	pass

func spawn_veggie():
	
	veggie_count = veggie_list.size()
	print_debug(String(veggie_count) + " veggies remaining")
	if veggie_count > 0:
		var veg_index = randi() % veggie_count-1
		var veg = veggie_list.pop_at(veg_index).instance()
		# veg.position = self.position
		veg.rotation = randf()*TAU
		
		print_debug("spawning" + veg.name + " at " + String(veg.position) + " and " + String(veg.rotation) + " radians")
		add_child(veg)
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
