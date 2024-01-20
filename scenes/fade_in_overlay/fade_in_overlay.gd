extends Control
class_name FadeIn

@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _ready() -> void:
	hide()

func fade_in():
	show()
	animation_player.play("fade_in_animation")
	await animation_player.animation_finished
	hide()
	
func fade_out():
	show()
	animation_player.play_backwards("fade_in_animation")
	await animation_player.animation_finished
	hide()
