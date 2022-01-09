extends Line2D
 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
 
var target
var point
export(NodePath) var targetPath
 
func _ready():
	target = get_node(targetPath)
	pass

var i = 0
var index = 0
var j = 0
var buff = Vector2()
var C = 2*PI*1700

func _physics_process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = target.position
	i+=1
	if i<1000:
		add_point(point)
	else:
		i=0
		remove_point(0)
	update()
