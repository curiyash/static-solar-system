extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = "res://Assets/data/Planets - Sheet1.csv"
var planets
func _ready():
	var data = Get_data()
	planets = showItems(data)
	print(planets["Earth"])
	pass

func Get_data():
	var maindata = {}
	var file = File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		maindata[maindata.size()] = data_set
	file.close()
	#print(maindata)
	return maindata

func showItems(data):
	#items.visible = false
	var planets = {}
	var info = []
	var count = 0
	for item in data.keys():
		if count and count<=8:
			info = []
			#var item_copy = items.duplicate()
			#var entity : Dictionary = data[item]
			var list = data[item]
			var name = list[0]
			var length = list[1]
			var dist = list[2]
			var namesake = list[3]
			var moon = list[4]
			var type = list[5]
			var mass = list[6]
			var diameter = list[7]
			var surfaceGravity = list[9]
			var rings = list[11]
			var temp = list[12]
			var peri = list[14]
			var apo = list[15]
			info.append(length)
			info.append(dist)
			info.append(namesake)
			info.append(moon)
			info.append(type)
			info.append(mass)
			info.append(diameter)
			info.append(surfaceGravity) #7
			info.append(rings) #8
			info.append(temp) #9
			info.append(peri) #10
			info.append(apo) #11
			planets[name] = info
		count+=1
	#	item_copy.text = str(entity[0]) + " " + str(entity[1]) + " " + str(entity[2]) + " " + str(entity[3])
	#	item_copy.visible = true
	#	$VBox.add_child(item_copy)
	#print(planets)
	return planets
	pass

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
	$Control2/Sprite.texture = load(name)
	var format = planet.substr(0, 1).to_upper()+planet.substr(1).to_lower()
	var diameter = 150
	var planet_obj
	var year
	var dist
	var namesake
	var moons
	var type
	var namen
	var mass
	var dia
	var rings
	var temp
	var peri
	var apo
	var surfaceGravity
	if format in planets.keys():
		planet_obj = planets[format]
		namen = "[center]Name: [u]%s[/u][/center]\n"%format
		path = "Planets/%s\n"%format
		namesake = "Namesake: %s\n"%planet_obj[2]
		type = "Type: %s\n"%planet_obj[4]
		mass = "Mass (in 10 [superscript]24[/superscript] kg): %s\n"%planet_obj[5]
		dia = "Diameter (in km): %s\n"%planet_obj[6]
		surfaceGravity = "Surface Gravity (in m/s [sup] 2 [/sup] ): %s\n"%planet_obj[7]
		temp = "Temp (in °C): %s\n"%planet_obj[9]
		year = "Length of year: %s\n"%planet_obj[0]
		dist = "Distance from Sun: %s\n"%planet_obj[1]
		peri = "Perihelion (in 10 [sup] 6 [/sup] km): %s\n"%planet_obj[10]
		apo = "Aphelion (in 10 [sup] 6 [/sup] km): %s\n"%planet_obj[11]
		moons = "Moons: %s\n"%planet_obj[3]
		rings = "Lord of the Rings?: %s"%planet_obj[8]
	if ($Control2/Sprite.texture):
		#var xScale = float(xSize)/$Control2/Sprite.texture.get_width()
		var scale = float(diameter)*2/$Control2/Sprite.texture.get_height()
		#print(xScale)
		#print(yScale)
		$Control2/Sprite.scale.x = scale*0.5
		$Control2/Sprite.scale.y = scale*0.5
		var spriteX = float($Control2.rect_size.x)/2
		var spriteY = float($Control2.rect_size.y)/2
		var sprite = Vector2(spriteX, spriteY)
		$Control2/Sprite.set_position(sprite)
		pass
	if format in planets.keys():
		$RichTextLabel.bbcode_text = "[url=https://en.wikipedia.org/wiki/Mars]%s[/url]"%namen
		$RichTextLabel.bbcode_text += namesake+type+mass+dia+surfaceGravity+temp+year+dist+peri+apo+moons+rings
	else:
		$RichTextLabel.text = "Planet not available in system"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
