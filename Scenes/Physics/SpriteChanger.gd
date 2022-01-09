extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var planet
var sprite
func _physics_process(delta):
	var planet_path = get_node("/root/Godot physics/physics/Planets")
	planet = $Control/OptionButton.planet_name
	sprite = $OptionButton.sprite_name
	var name = "res://Assets/Sprites/%s.png"%sprite
	if sprite:
		$Sprite.texture = load(name)
	#if sprite!="":
	#	$Sprite.texture = load(name)
	if planet_path.get_node(planet):
		planet_path.get_node(planet).get_node("CollisionShape2D/Sprite").texture = load(name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
