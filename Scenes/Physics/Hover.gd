extends Control

func _ready():
	$ColorRect/Sprite.texture = load("res://New Assets/earth.png")
	#get_node(".").hide()

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
		get_node("ColorRect").show()
	else:
		get_node("ColorRect").hide()

func _on_mouse_entered():
	#$ColorRect/RichTextLabel.text = "Name: "+get_parent().name
	#var pos = get_parent().position
	#$ColorRect/RichTextLabel.text += "\nDistance: "+str(pos)
	#var vel = Vector2Val(get_parent().get_linear_velocity())
	#$ColorRect/RichTextLabel.text += "\nVelocity: "+str(vel)
	$ColorRect/RichTextLabel.text = "Hello"


func _on_Earth_mouse_entered():
	entered = true
	pass # Replace with function body.

func _on_Earth_mouse_exited():
	entered = false
	pass # Replace with function body.
