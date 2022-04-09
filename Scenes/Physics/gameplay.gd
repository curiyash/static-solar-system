extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var texture
var prev_zoom
func _ready():
	texture = $TextureRect.texture.resource_path
	prev_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _physics_process(_delta):
	#var node = get_node("/root/Godot physics/physics/CanvasLayer/StaticTools/VBoxContainer/Control/OptionButton2").bg
	#var path = "res://Assets/BG images/%s.jpeg"%node
	#var actual = $TextureRect.texture.resource_path
	#if (node and actual!=path):
#		print("hello")
#		$TextureRect.texture = load(path)
	#pass

var begin = 0
var ret = 0

func _on_Add2_pressed():
	var z = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	print("speed: %f"%get_node("TextureRect").scroll_speed)
	print("z: %f"%z)
	print("prev_zoom: %f"%prev_zoom)
	var s_speed = get_node("TextureRect").scroll_speed
	if z>0.62 and z<100:
		if z/1.5>1:
			if ret:
				get_node("TextureRect").scroll_speed = 2*(s_speed/z)
			else:
				get_node("TextureRect").scroll_speed = 2*(s_speed/(z/1.5))
		else:
			if ret:
				get_node("TextureRect").scroll_speed = (s_speed*z)*2
			else:
				get_node("TextureRect").scroll_speed = (s_speed*(z/1.5))*2
		prev_zoom = z
		ret = ret^1
	print("s_speed: %f"%get_node("TextureRect").scroll_speed)
	pass # Replace with function body.


func _on_Add3_pressed():
	var z = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	var s_speed = get_node("TextureRect").scroll_speed
	print("z: %f"%z)
	print("prev_zoom: %f"%prev_zoom)
	if z<100 and z>0.62:
		if z*1.5>1:
			if ret:
				get_node("TextureRect").scroll_speed = (s_speed*z)/2
			else:
				get_node("TextureRect").scroll_speed = (s_speed*(z*1.5))/2
		else:
			if ret:
				get_node("TextureRect").scroll_speed = (s_speed/z)/2
			else:
				get_node("TextureRect").scroll_speed = (s_speed/(z*1.5))/2
		ret = ret^1
		prev_zoom = z
	print("s_speed: %f"%get_node("TextureRect").scroll_speed)
	pass # Replace with function body.


func _on_SetSpeed_pressed():
	if get_node("TextureRect").scroll_speed!=0:
		get_node("TextureRect").scroll_speed = 0
	else:
		get_node("TextureRect").scroll_speed = 0.2
	pass # Replace with function body.


func _on_Home_Button_pressed():
	get_tree().change_scene("res://Scenes/Interface/Home UI.tscn") # Replace with function body.
