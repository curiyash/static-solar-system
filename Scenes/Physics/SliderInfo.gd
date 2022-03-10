extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = "res://Assets/data/Planets.prn"
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
			info.append(length)
			info.append(dist)
			info.append(namesake)
			info.append(moon)
			info.append(type)
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
	if format in planets.keys():
		planet_obj = planets[format]
		namen = "[center]Name: [u]%s[/u][/center]"%format
		path = "Planets/%s"%format
		year = "Length of year: %s"%planet_obj[0]
		dist = "Distance from Sun: %s"%planet_obj[1]
		namesake = "Namesake: %s"%planet_obj[2]
		moons = "Moons: %s"%planet_obj[3]
		type = "Type: %s"%planet_obj[4]
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
		$RichTextLabel.bbcode_text = "[url=https://en.wikipedia.org/wiki/Mars]%s[/url]"%namen+"\n"+year+"\n"+dist+"\n"+namesake+"\n"+moons+"\n"+type
	else:
		$RichTextLabel.text = "Planet not available in system"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
