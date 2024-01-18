extends Actionable
@onready var button_led: ButtonLED = $".."

func get_current_value() -> String:
	return button_led.text
	
func get_random_value() -> String:
	return button_led.text

func get_manual_text(value: String) -> String:
	return "Press key: {0}".format([value])
