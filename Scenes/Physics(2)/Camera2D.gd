extends Camera2D
var stop = false
func _process(delta):
	var move_speed = 1000*get_zoom().x/Engine.time_scale
	var origin = get_global_transform_with_canvas().origin
	if Input.is_action_pressed("ui_left"):
		if origin.x>=-78978.6875:
			global_position += Vector2.LEFT * delta * move_speed
		else:
			stop = true
	if Input.is_action_pressed("ui_right"):
		if origin.x<=80123:
			global_position += Vector2.RIGHT * delta * move_speed
			stop = false
		else:
			stop = true
	if Input.is_action_pressed("ui_up"):
		if origin.y>=-172954.46875:
			global_position += Vector2.UP * delta * move_speed
			stop = false
		else:
			stop = true
	if Input.is_action_pressed("ui_down"):
		if origin.y<=173307.734375:
			global_position += Vector2.DOWN * delta * move_speed
			stop = false
		else:
			stop = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var target
export(NodePath) var targetPath
export(float) var size
func _ready():
	target = get_node(targetPath)
	print(target)
	pass # Replace with function body.

#func _physics_process(delta):
#	size = get_zoom()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _on_Button2_pressed():
#	set_zoom(get_zoom()/1.5) # Replace with function body.


#func _on_Button_pressed():
#	set_zoom(get_zoom()*1.5)# Replace with function body.

func _on_Add2_pressed():
	if get_zoom().x>0.08 and !stop:
		set_zoom(get_zoom()/1.5)

func _on_Add3_pressed():
	if get_zoom().x<269.1 and !stop:
		set_zoom(get_zoom()*1.5)

func _on_Slider_pressed():
	var visibility = target.is_visible()
	if !visibility:
		target.set_visible(true)
	else:
		target.set_visible(false)

func _on_Dynamis_pressed():
	var vis = get_parent().get_node("DynamicTools").is_visible()
	if !vis:
		get_parent().get_node("DynamicTools").set_visible(true)
	else:
		get_parent().get_node("DynamicTools").set_visible(false)
	pass # Replace with function body.


func _on_Static_pressed():
	var vis = get_parent().get_node("StaticTools").is_visible()
	if !vis:
		get_parent().get_node("StaticTools").set_visible(true)
	else:
		get_parent().get_node("StaticTools").set_visible(false)
	pass # Replace with function body.
