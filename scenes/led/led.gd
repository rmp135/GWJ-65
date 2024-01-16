extends Node2D
class_name LED

@export var flashing := false
@export var on := false
@onready var animated_sprite_2d = $AnimatedSprite2D

var label := ""

func _process(delta):
	if on:
		animated_sprite_2d.frame = 1
		animated_sprite_2d.pause()
	elif flashing:
		animated_sprite_2d.play()
	else:
		animated_sprite_2d.frame = 0
		animated_sprite_2d.pause()
