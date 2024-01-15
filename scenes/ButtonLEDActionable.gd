extends Actionable
@onready var button_led: ButtonLED = $".."

func get_action_value() -> String:
	return button_led.text
