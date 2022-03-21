extends Node2D

var R = [39, 72.3, 100, 152.4]
var G = 6.671e-7
var body2 = {mass = 1e10, position = Vector2(612, 350), velocity = Vector2()}
var body1 = {mass = 1660.1, position = Vector2(573, 350), velocity = Vector2(0, sqrt(G*body2.mass/R[0]))}
#var dy3 = {mass = 6000, position = Vector2(539.7, 350), velocity = Vector2(0, sqrt(G*body2.mass/R[1]))}
#var body4 = {mass = 30034.89596, position = Vector2(512, 350), velocity = Vector2(0, sqrt(G*body2.mass/R[2]))}
#var body5 = {mass = 3227.151, position = Vector2(459.6, 350), velocity = Vector2(0, sqrt(G*body2.mass/R[3]))}
#var bodies = [body1, body3, body4, body5]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var point

# Called when the node enters the scene tree for the first time.
func _ready():
	$Planets/Sun.set_mass(103680000000000)
	$Planets/Mercury.set_mass (17029440)
	$Planets/Mercury.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Mercury.position.x)))
	$Planets/Venus.set_mass (252305280)
	$Planets/Venus.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Venus.position.x)))	
	$Planets/Earth.set_mass (309598848)
	$Planets/Earth.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Earth.position.x)))	
	$Planets/Mars.set_mass (33125760)
	$Planets/Mars.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Mars.position.x)))
	$Planets/Jupiter.set_mass (98399059200)
	$Planets/Jupiter.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Jupiter.position.x)))
	$Planets/Saturn.set_mass (29460672000)
	$Planets/Saturn.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Saturn.position.x)))
	$Planets/Uranus.set_mass (4500230400)
	$Planets/Uranus.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Uranus.position.x)))
	$Planets/Neptune.set_mass (5308416000)
	$Planets/Neptune.set_linear_velocity(Vector2(0, sqrt(G*$Planets/Sun.get_mass()/$Planets/Neptune.position.x)))
	#print(.get_linear_velocity())
	#get_node("mars3/moon").set_mass(7.3e10)
	#get_node("mars3/moon").set_linear_velocity(Vector2($mars3.get_linear_velocity()/29.44) + $mars3.get_linear_velocity())
	set_process(true)

var state = true

var counter = 0

func _physics_process(delta):
	var planets = [$Planets/Mercury, $Planets/Venus, $Planets/Earth, $Planets/Mars, $Planets/Jupiter, $Planets/Saturn, $Planets/Uranus, $Planets/Neptune]
	var i = 0
	var star = $Planets/Sun
	for planet in planets:
		#position
		var pos = star.position - planet.position
	
		#planet.position = Vector2(pos.x, pos.y)
		var r = sqrt(pow(pos.x, 2)+pow(pos.y, 2))
		#var dist = sqrt((pos_y*pos_y)+(pos_x*pos_x))
		var force_x = (G*star.get_mass()*planet.get_mass()*pos.x) / (pow(r, 3))
		var force_y = (G*star.get_mass()*planet.get_mass()*pos.y) / (pow(r, 3))
		#interaction between 
		var bodies = 0
		if i > 0:
			bodies = planets.slice(0, i-1) + planets.slice(i+1, -1)	
		else:
			bodies = planets.slice(1,-1)
		var force = Vector2(force_x,force_y)
		for body in bodies:
			var pos_x = body.position.x - planet.position.x
			var pos_y = body.position.y - planet.position.y
			var R = sqrt(pow(pos_x,2)+ pow(pos_y,2))
			var force_x1 = (G*body.get_mass()*planet.get_mass()*pos_x)/ (pow(R,3))
			var force_y1= (G*body.get_mass()*planet.get_mass()*pos_y)/(pow(R,3))
			force += Vector2(force_x1,force_y1)
			
		planet.set_applied_force(force)
		i += 1
		
		#print(sqrt($Earth.get_linear_velocity().x*$Earth.get_linear_velocity().x+$Earth.get_linear_velocity().y*$Earth.get_linear_velocity().y))
		#print(delta)
		#print(delta)
	#_on_Add_pressed()
	#_on_Subtract_pressed()
	#print(delta)
	pass
	
#func _process(delta):
#	var planets = [$Earth, $mars, $mars2, $mars3, $mars4, $mars5, $mars6]
#	print(state)
#	for planet in planets:
#		planet.set_linear_velocity(Vector2())
#var pos_x = $mars.position.x - $Earth.position.x
		#var pos_y = $mars.position.y - $Earth.position.y

func _on_Add_pressed():
	#var og = G
	#G*=10
	#Engine.time_scale = Engine.get_time_scale()*2
	$Planets/Mercury.set_linear_velocity($Planets/Mercury.get_linear_velocity()*sqrt(2))
	$Planets/Venus.set_linear_velocity($Planets/Venus.get_linear_velocity()*sqrt(2))
	$Planets/Earth.set_linear_velocity($Planets/Earth.get_linear_velocity()*sqrt(2))
	$Planets/Mars.set_linear_velocity($Planets/Mars.get_linear_velocity()*sqrt(2))
	$Planets/Jupiter.set_linear_velocity($Planets/Jupiter.get_linear_velocity()*sqrt(2))
	$Planets/Saturn.set_linear_velocity($Planets/Saturn.get_linear_velocity()*sqrt(2))
	$Planets/Uranus.set_linear_velocity($Planets/Uranus.get_linear_velocity()*sqrt(2))
	$Planets/Neptune.set_linear_velocity($Planets/Neptune.get_linear_velocity()*sqrt(2))
	G = G*2
	#$Earth.set_linear_velocity($Earth.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars.set_linear_velocity($mars.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars2.set_linear_velocity($mars2.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars3.set_linear_velocity($mars3.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars4.set_linear_velocity($mars4.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars5.set_linear_velocity($mars5.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars6.set_linear_velocity($mars6.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars4.set_position($mars4.get_position()/2)
	#state = true
	#counter = 1
	#var planets = [$Earth, $mars, $mars2, $mars3, $mars4, $mars5, $mars6]
	#G = G*10
	#var txtLabel = float(get_node("CanvasLayer/LineEdit").get_text())
	#var lv = $Planets/mars4.get_linear_velocity()
	#$Planets/mars4.set_linear_velocity(lv*txtLabel)
	#print(state)
	#set_physics_process(false)
	#var initial_pos = $mars4.position
	#$mars4.position = initial_pos*2.01
	#pass # Replace with function body.

func _on_Subtract_pressed():
	#var og = G
	#G/=10
	$Planets/Mercury.set_linear_velocity($Planets/Mercury.get_linear_velocity()/sqrt(2))
	$Planets/Venus.set_linear_velocity($Planets/Venus.get_linear_velocity()/sqrt(2))
	$Planets/Earth.set_linear_velocity($Planets/Earth.get_linear_velocity()/sqrt(2))
	$Planets/Mars.set_linear_velocity($Planets/Mars.get_linear_velocity()/sqrt(2))
	$Planets/Jupiter.set_linear_velocity($Planets/Jupiter.get_linear_velocity()/sqrt(2))
	$Planets/Saturn.set_linear_velocity($Planets/Saturn.get_linear_velocity()/sqrt(2))
	$Planets/Uranus.set_linear_velocity($Planets/Uranus.get_linear_velocity()/sqrt(2))
	$Planets/Neptune.set_linear_velocity($Planets/Neptune.get_linear_velocity()/sqrt(2))
	G = G/2
	
	#Engine.time_scale = Engine.get_time_scale()/2
	
	#var txtLabel = float(get_node("CanvasLayer/LineEdit").get_text())
	#$Earth.set_linear_velocity($Earth.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars.set_linear_velocity($mars.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars2.set_linear_velocity($mars2.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars3.set_linear_velocity($mars3.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars4.set_linear_velocity($mars4.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars5.set_linear_velocity($mars5.get_linear_velocity()*sqrt(G)/sqrt(og))
	#$mars6.set_linear_velocity($mars6.get_linear_velocity()*sqrt(G)/sqrt(og))
	#var lv = $Planets/mars4.get_linear_velocity()
	#$Planets/mars4.set_linear_velocity(lv/txtLabel)
	#$mars4.set_position($mars4.get_position()/2)
	#set_physics_process(true)
	#var initial_pos = $mars4.position
	#$mars4.position = initial_pos/1.01
	#print(initial_pos)
	#G = G/10
	#var lv = $mars4.get_mass()
	#$mars4.set_mass(lv/10)

func _on_Button_pressed():
	Engine.time_scale = 1.0
	get_tree().change_scene(get_tree().current_scene.filename)
	pass # Replace with function body.

func _on_CheckButton_pressed():
	var trails = get_node("Trails")
	if trails.is_visible()==true:
		trails.set_visible(false)
		$CanvasLayer/StaticTools/TextureRect/CheckButton/Label2.text = "On"
	else:
		trails.set_visible(true)
		$CanvasLayer/StaticTools/TextureRect/CheckButton/Label2.text = "Off"

func _on_Remove_pressed():
	print("Removing")
	return $Planets/mars4
	pass # Replace with function body.

func _on_Links_meta_clicked(meta):
	OS.shell_open("https://en.wikipedia.org/wiki/Mars")
	pass # Replace with function body.

func _on_Speed_Up_pressed():
	var factor = float(get_node("CanvasLayer/StaticTools/DynamicTools/TextureRect6/TextureRect3/Velocity").get_text())
	var planet = $CanvasLayer/StaticTools/DynamicTools/Dynamic/OptionButton.planet_name
	print(factor)
	print(planet)
	#var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var path = "Planets/%s"%planet
	if get_node(path):
		var node = get_node(path)
		if node.has_method("get_linear_velocity"):
			#print(node.get_linear_velocity())
			node.set_linear_velocity(node.get_linear_velocity()*factor)
	pass # Replace with function body.

func _on_Speed_Down_pressed():
	var factor = float(get_node("CanvasLayer/StaticTools/DynamicTools/TextureRect6/TextureRect3/Velocity").get_text())
	var planet = $CanvasLayer/StaticTools/DynamicTools/Dynamic/OptionButton.planet_name
	#print(factor)
	#print(planet)
	#var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var path = "Planets/%s"%planet
	if get_node(path):
		var node = get_node(path)
		if node.has_method("get_linear_velocity"):
			#print(node.get_linear_velocity())
			node.set_linear_velocity(node.get_linear_velocity()/factor)
#	pass # Replace with function body.


func _on_MassI_pressed():
	var factor = float(get_node("CanvasLayer/StaticTools/DynamicTools/TextureRect5/TextureRect3/Mass").get_text())
	var planet = $CanvasLayer/StaticTools/DynamicTools/Dynamic/OptionButton.planet_name
	#print(factor)
	#print(planet)
	#print("Hello")
	#var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var path = "Planets/%s"%planet
	if get_node(path):
		var node = get_node(path)
		if node.has_method("get_mass"):
			#print(node.get_linear_velocity())
			node.set_mass(node.get_mass()*factor)


func _on_MassD_pressed():
	var factor = float(get_node("CanvasLayer/StaticTools/DynamicTools/TextureRect5/TextureRect3/Mass").get_text())
	var planet = $CanvasLayer/StaticTools/DynamicTools/Dynamic/OptionButton.planet_name
	#print(factor)
	#print(planet)
	#var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var path = "Planets/%s"%planet
	if get_node(path):
		var node = get_node(path)
		if node.has_method("get_linear_velocity"):
			#print(node.get_linear_velocity())
			#print(node.get_mass())
			node.set_mass(node.get_mass()/factor)


func _on_CheckButton2_pressed():
	var current = get_node("Orbits")
	if current.is_visible()==true:
		current.set_visible(false)
		$CanvasLayer/StaticTools/TextureRect2/CheckButton2/Label.text = "On"
	else:
		current.set_visible(true)
		$CanvasLayer/StaticTools/TextureRect2/CheckButton2/Label.text = "Off"
	pass # Replace with function body.
