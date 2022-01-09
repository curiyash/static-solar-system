extends Node

export(float) var scroll_speed = 0.1

func _physics_process(delta):
	self.material.set_shader_param("scroll_speed", scroll_speed)
