extends Sprite
signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var score = 0
onready var veggies = get_node("/root/Node2D/veggies").get_child_count()
var textbox


# Called when the node enters the scene tree for the first time.
func _ready():
	textbox = $RichTextLabel
	$veggie_count/RichTextLabel.text = String(veggies)
	pass # Replace with function body.

func _on_add_score(points):
	if points:
		score += points
	# print_debug(score)

func _veggie_update(veg):
	veggies += veg
	print_debug(veggies)
	$veggie_count/RichTextLabel.text = String(veggies)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if score <0: score = 0
	textbox.text = String(score)
	
	pass


func _on_killzone_body_entered(_body:Node):
	_veggie_update(-1)
	if veggies <= 0:
		self.emit_signal("game_over")
	pass # Replace with function body.
