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

func _on_Add2_pressed():
	var z = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	var s_speed = get_node("TextureRect").scroll_speed
	get_node("TextureRect").scroll_speed = s_speed*z/5/Engine.time_scale
	prev_zoom = z
	pass # Replace with function body.


func _on_Add3_pressed():
	var z = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	var s_speed = get_node("TextureRect").scroll_speed
	get_node("TextureRect").scroll_speed = s_speed/(prev_zoom)*5*Engine.time_scale
	pass # Replace with function body.


func _on_SetSpeed_pressed():
	if get_node("TextureRect").scroll_speed!=0:
		get_node("TextureRect").scroll_speed = 0
	else:
		get_node("TextureRect").scroll_speed = 0.2
	pass # Replace with function body.