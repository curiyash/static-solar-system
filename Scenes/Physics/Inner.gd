extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var prev_zoom
# Called when the node enters the scene tree for the first time.
func _ready():
	prev_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	pass # Replace with function body.

func _physics_process(delta):
	var screen_zoom = get_node("/root/Godot physics/physics/CanvasLayer/Camera2D").get_zoom().x
	var sprite = get_node(".")
	if (prev_zoom<screen_zoom):
		sprite.set_scale(sprite.get_scale()*1.21)
		prev_zoom = screen_zoom
	elif (prev_zoom>screen_zoom):
		sprite.set_scale(sprite.get_scale()/1.21)
		prev_zoom = screen_zoom
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
