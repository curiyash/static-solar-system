extends Line2D
 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
 
var target
var point
export(NodePath) var targetPath
var prev_zoom
func _ready():
	target = get_node(targetPath)
	prev_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	pass

var i = -1
var index = 0
var j = 0
var buff = Vector2()

func _physics_process(delta):
	#global_position = Vector2(0,0)
	#global_rotation = 0
	point = target.position
	if get_point_count()==100:
		for k in range(10):
			j += k
			remove_point(j)
			return j
	if j==100:
		j = 0
	add_point(point)
	var screen_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	var line = get_node(".")
	if (prev_zoom<screen_zoom):
		line.set_width(line.get_width()*1.21)
		prev_zoom = screen_zoom
	elif (prev_zoom>screen_zoom):
		line.set_width(line.get_width()/1.21)
		prev_zoom = screen_zoom
	update()
