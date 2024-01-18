extends Node2D

@onready var clock_label: Label = %ClockLabel

var hour := 9
var minute := 0

func _on_timer_timeout() -> void:
	minute += 15
	if minute == 60:
		minute = 0
		hour += 1
	var label = "{0}:{1}".format([str(hour).lpad(2, "0"), str(minute).lpad(2, "0")])
	clock_label.text = label
