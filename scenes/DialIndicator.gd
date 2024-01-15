extends Indicator

@onready var dial: Dial = $".."

func get_current_value() -> String:
	return str(dial.index)

# gets a possible value for faults
func get_random_value() -> String:
	return "on"

# gets the explanation text required in the manual
func get_manual_text() -> String:
	return "Dial {0} must be set to position {1}".format([dial.text, dial.index])
