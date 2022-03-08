extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var bg

# Called when the node enters the scene tree for the first time.
func _ready():
	add_separator()
	add_item("bg1")
	add_item("bg2")
	add_item("bg3")
	add_item("bg4")
	add_item("network stars")
	add_item("wc1")
	add_item("fabric")
	add_item("clouds")
	add_item("funky")
	add_item("profile")
	add_item("wc2")
	add_item("wc3")
	add_item("wc4")
	add_item("wc5")
	add_item("wc6")
	pass # Replace with function body.

func make_option_button_items_non_radio_checkable(option_button: OptionButton) -> void:
	pass
#func add_items():
#	OptionButton.add_item("Planets")
	
#	OptionButton.add_item("Item 0")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_OptionButton2_item_selected(index):
	bg = get_item_text(index)
	#node.texture = load("res://Assets/BG images/%s.png"%bg)
	pass # Replace with function body.
