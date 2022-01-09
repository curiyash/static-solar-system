extends Node2D

export(int) var speed: int = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2(1, 0)

onready var parallax = $ParallaxBackground
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	parallax.scroll_offset += direction*speed*delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
