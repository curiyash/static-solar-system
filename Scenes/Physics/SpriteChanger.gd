extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var prev_sprite
var prev_planet
# Called when the node enters the scene tree for the first time.
func _ready():
	prev_sprite = $OptionButton.sprite_name
	prev_planet = $Control/OptionButton.planet_name
	pass # Replace with function body.
var planet
var sprite

func _physics_process(delta):
	var planet_path = get_node("/root/Godot physics/physics/Planets")
	planet = $Control/OptionButton.planet_name
	sprite = $OptionButton.sprite_name
	var name = "res://Assets/Sprites/%s.png"%sprite
	if sprite!="Sprites" and sprite!=prev_sprite:
		$Sprite.texture = load(name)
		prev_sprite = $OptionButton.sprite_name
	#if sprite!="":
	#	$Sprite.texture = load(name)
	if planet!="Planet":
		if planet!=prev_planet and planet_path.get_node(planet):\
			planet_path.get_node(planet).get_node("CollisionShape2D/Sprite").texture = load(name)
			prev_planet = planet
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
