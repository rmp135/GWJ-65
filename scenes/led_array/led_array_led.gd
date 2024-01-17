extends Node2D
class_name LEDArrayLED
@onready var led: LED = $LED
@onready var timer: Timer = $Timer

var label : String :
	get: return led.label
	set(value): led.label = value

func _ready() -> void:
	led.on = randi_range(0, 1) == 0
	timer.start(randf_range(5, 30))

func _on_timer_timeout() -> void:
	if !led.flashing:
		led.on = !led.on
	timer.start(randf_range(5, 30))
