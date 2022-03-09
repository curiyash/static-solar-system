extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _draw():
	#if Input.is_action_just_released("ui_up"):
	draw_arc(Vector2(), 420, 0, deg2rad(360), 500, Color(0.24, 0.24, 0.24, 0.9), 0.1)
	draw_arc(Vector2(), 775, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.1)
	draw_arc(Vector2(), 1037, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.1)
	draw_arc(Vector2(), 1637, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.1)
	draw_arc(Vector2(), 5600, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.01)
	draw_arc(Vector2(), 10274, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.01)
	draw_arc(Vector2(), 20677, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.01)
	draw_arc(Vector2(), 32372, 0, deg2rad(360), 500, Color(0.2, 0.2, 0.2, 0.9), 0.01)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckButton2_pressed():
	var current = get_node(".")
	if current.is_visible()==true:
		get_node(".").set_visible(false)
	else:
		get_node(".").set_visible(true)
	pass # Replace with function body.
