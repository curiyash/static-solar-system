extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var sprite_name

# Called when the node enters the scene tree for the first time.
func _ready():
	add_separator()
	add_item("Mercury")
	add_item("Venus")
	add_item("Earth")
	add_item("Mars")
	add_item("Jupiter")
	add_item("Saturn")
	add_item("Uranus")
	add_item("Neptune")
	pass # Replace with function body.

func make_option_button_items_non_radio_checkable(option_button: OptionButton) -> void:
	pass
#func add_items():
#	OptionButton.add_item("Planets")
	
#	OptionButton.add_item("Item 0")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
func _on_OptionButton_item_selected(index):
	sprite_name = get_item_text(index)
	pass # Replace with function body.
