extends Node2D
class_name LoadingLED

@onready var loading_led_off: Sprite2D = $LoadingLEDOff
@onready var loading_led_on: Sprite2D = $LoadingLEDOn

func set_on():
	loading_led_off.hide()
	loading_led_on.show()
