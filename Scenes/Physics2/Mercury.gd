extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var clamping = false
func _physics_process(delta):
	position.x = clamp(position.x, -78978.6875, 80123)
	position.y = clamp(position.y, -172954.46875, 173307.734375)
	if position.x<=-78978.6875 or position.x>=80123:
		set_linear_velocity(Vector2(0, 0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
