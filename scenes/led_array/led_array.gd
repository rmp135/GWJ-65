extends Node2D

@onready var leds_container: Node2D = $LEDs

func _ready() -> void:
	var all_leds = leds_container.get_children()
	# 97 - 122
	var letters = [randi_range(97, 122),randi_range(97, 122),randi_range(97, 122)]
	letters.shuffle()
