extends ColorRect

func _ready():
	connect("mouse_entered", self, "_mouse_entered")
	connect("mouse_exited", self, "_mouse_exited")
	$Label.hide()
	get_node(".").set_frame_color(Color(255, 255, 255, 0))

func Vector2Val(vector):
	var x = vector.x
	var y = vector.y
	var mag = sqrt(pow(x, 2)+pow(y, 2))
	return mag

var entered = false
func _mouse_entered():
	entered = true
func _mouse_exited():
	entered = false

func _physics_process(delta):
	if entered:
		_on_mouse_entered()
		get_node(".").set_frame_color(Color(255, 255, 255, 0.2))
		$Label.show()
	else:
		get_node(".").set_frame_color(Color(255, 255, 255, 0))
		$Label.hide()

func _on_mouse_entered():
	$Label.text = "Name: "+get_parent().name
	var pos = get_parent().position
	print(get_parent().name)
	$Label.text += "\nDistance: "+str(pos)
	$Label.text += "\nMass: "+str(1e12)
	var vel = Vector2Val(get_parent().get_linear_velocity())
	$Label.text += "\nVelocity: "+str(vel)
