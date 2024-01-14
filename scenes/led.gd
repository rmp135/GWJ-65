extends Node2D

@export var flashing: bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if flashing:
		animated_sprite_2d.play()
	else:
		animated_sprite_2d.frame = 0
		animated_sprite_2d.pause()
