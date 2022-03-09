extends TextureRect

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func Vector2Val(vector):
	var x = vector.x
	var y = vector.y
	var mag = sqrt(pow(x, 2)+pow(y, 2))
	return mag

func _on_mouse_entered():
	print("hello")
	var par = get_parent().get_parent().get_node("CanvasLayer/Label")
	par.text = "Planet name: "+get_parent().name
	par.text += "\nPlanet mass: "+str(1e12)
	var vel = Vector2Val(get_parent().get_linear_velocity())
	par.text += "\nPlanet velocity: "+str(vel)
	par.show()

func _on_mouse_exited():
	print("bye")
	var par = get_parent().get_parent().get_node("CanvasLayer/Label")
	par.hide()
