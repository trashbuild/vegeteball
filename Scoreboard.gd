extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var score = 0
export var veggies = 0
var textbox


# Called when the node enters the scene tree for the first time.
func _ready():
	textbox = $RichTextLabel
	pass # Replace with function body.

func _on_add_score(points):
	score += points
	# print_debug(score)

func _veggie_update(veg):
	veggies += veg
	print_debug(veggies)
	$veggies/RichTextLabel.text = String(veggies)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	textbox.text = String(score)
	
	pass


func _on_killzone_body_entered(body:Node):
	_veggie_update(-1)
	pass # Replace with function body.
