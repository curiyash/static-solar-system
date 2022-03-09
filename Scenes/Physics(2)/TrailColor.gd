extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var planet
onready var trail = get_node("/root/Godot physics/physics/Trails")
func _physics_process(delta):
	planet = $Control/OptionButton.planet_name
	if trail.get_node(planet):
		trail.get_node(planet).default_color = $Control/ColorPicker.get_pick_color()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
