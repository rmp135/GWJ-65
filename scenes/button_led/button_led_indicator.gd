extends Indicator

@onready var button: ButtonLED = $".."

var faulting_value := "on"

func _ready() -> void:
	faulting_value = ["on", "off"].pick_random()
	super._ready()

func get_current_value() -> String:
	return "on" if button.enabled else "off"

# gets a possible value for faults
func get_random_value() -> String:
	return faulting_value

# gets the explanation text required in the manual
func get_manual_text() -> String:
	return "Button {0} must be {1}".format([button.text, faulting_value])
