extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_add_score(points):
	score += points
	print_debug(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
