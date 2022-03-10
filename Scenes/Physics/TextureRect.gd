extends TextureRect

var prev_zoom

func _ready():
	prev_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	#connect("mouse_entered", self, "_mouse_entered")
	#connect("mouse_exited", self, "_mouse_exited")
	$ColorRect/Label.hide()

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
	var zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	if zoom!=prev_zoom:
			get_node(".").rect_size.x = get_node(".").rect_size.y*zoom/prev_zoom/1.1
			get_node(".").rect_size.y = get_node(".").rect_size.y*zoom/prev_zoom/1.1
			var node = get_node(".")
			node.margin_bottom = node.rect_size.y/2
			node.margin_top = -node.rect_size.y/2
			node.margin_left = -node.rect_size.y/2
			node.margin_right = node.rect_size.y/2
			$ColorRect.rect_size.x = $ColorRect.rect_size.x*zoom/prev_zoom
			$ColorRect.rect_size.y = $ColorRect.rect_size.y*zoom/prev_zoom
			var font = $ColorRect/Label.get_font("font", "")
			font.size = font.size*zoom/prev_zoom
			$ColorRect/Label.add_font_override("font", font)
			prev_zoom = zoom
	if entered:
		_on_mouse_entered()
		get_node("ColorRect").set_frame_color(Color(255, 255, 255, 0.2))
		$ColorRect/Label.show()
	else:
		get_node("ColorRect").set_frame_color(Color(255, 255, 255, 0))
		$ColorRect/Label.hide()

func _on_mouse_entered():
	$ColorRect/Label.text = "Name: "+get_parent().name
	var pos = get_parent().position
	$ColorRect/Label.text += "\nDistance: "+str(pos)
	$ColorRect/Label.text += "\nMass: "+str(1e12)
	var vel = Vector2Val(get_parent().get_linear_velocity())
	$ColorRect/Label.text += "\nVelocity: "+str(vel)


func _on_TextureRect2_mouse_entered():
	entered = true
	pass # Replace with function body.


func _on_TextureRect2_mouse_exited():
	entered = false
	pass # Replace with function body.
