extends Node2D

@onready var leds_container: Node2D = $LEDs

@onready var top_left: Label = $Labels/TopLeft
@onready var top_middle: Label = $Labels/TopMiddle
@onready var top_right: Label = $Labels/TopRight
@onready var left_top: Label = $Labels/LeftTop
@onready var left_middle: Label = $Labels/LeftMiddle
@onready var left_bottom: Label = $Labels/LeftBottom

func _ready() -> void:
	var all_leds = leds_container.get_children()
	# 65 - 90 A - Z
	var start_number = randi_range(1, 7)
	top_left.text = str(start_number)
	top_middle.text = str(start_number + 1)
	top_right.text = str(start_number + 2)
	
	var start_letter = randi_range(65, 88)
	left_top.text = char(start_letter)
	left_middle.text = char(start_letter + 1)
	left_bottom.text = char(start_letter + 2)
	for i in all_leds.size():
		var led : LEDArrayLED = all_leds[i]
		led.label = "{0}{1}".format([start_number + i % 3, char(start_letter + i / 3)])
	
	# The LEDs are ordered left to right but the manual is easier to read top to bottom.
	# Quick hack to reorder the LEDs before the manual reads them.
	all_leds.sort_custom(func(a,b): return a.label < b.label)
	for i in all_leds.size():
		leds_container.move_child(all_leds[i], i)
