extends Indicator

@onready var button: ButtonLED = $".."

var r_val: String = "on"

func _ready() -> void:
	r_val = ["on", "off"].pick_random()
	super._ready()

func get_current_value() -> String:
	return "on" if button.enabled else "off"

# gets a possible value for faults
func get_random_value() -> String:
	return r_val

# gets the explanation text required in the manual
func get_manual_text() -> String:
	return "Button {0} must be {1}".format([button.text, r_val])
