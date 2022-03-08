extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var planet
func get_mag(pos):
	var x = pos.x
	var y = pos.y
	var mag = sqrt(pow(x, 2)+pow(y, 2))
	return mag

func _physics_process(delta):
	planet = $Control/OptionButton.planet_name #$LineEdit.get_text()
	var name = "res://New Assets/%s.png"%planet
	$Sprite.texture = load(name)
	var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var namen = "[center]Name: [u]%s[/u][/center]"%format
	var path = "Planets/%s"%format
	var dist
	var velocity
	var planet_mass
	if get_parent().get_parent().get_node(path):
		var node = get_parent().get_parent().get_node(path)
		var pos = node.position
		var d = get_mag(pos)
		dist = "Distance: %.3f"%d
		
		if node.has_method("get_linear_velocity"):
			var vel = node.get_linear_velocity()
			var v = get_mag(vel)
			velocity = "Velocity: %.3f"%v
		if node.has_method("get_mass"):
			var mass = node.get_mass()
			planet_mass = "Mass: %d"%mass
	if dist and namen and velocity and planet_mass:
		$RichTextLabel.bbcode_text = namen+"\n"+dist+"\n"+velocity+"\n"+planet_mass
	else:
		$RichTextLabel.text = "Planet not available in system"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
