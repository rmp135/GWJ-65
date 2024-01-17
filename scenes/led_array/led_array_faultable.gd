extends Faultable
class_name LEDArrayFaultable

@onready var led: LED = $"../LED"

func get_label() -> String:
	return "LED {0}".format([led.label])

func fault() -> void:
	led.flashing = true
	
func resolve() -> void:
	led.flashing = false
