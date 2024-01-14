extends Indicator

@onready var button: ButtonLED = $".."

func get_current_value() -> String:
	return "on" if button.enabled else "off"

# gets a possible value for faults
func get_random_value() -> String:
	return "on"

# gets the explanation text required in the manual
func get_manual_text() -> String:
	return "Button {0} must be on".format([button.text])
