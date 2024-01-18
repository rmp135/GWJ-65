extends Indicator

@onready var button: ButtonLED = $".."

func _ready() -> void:
	super._ready()

func get_current_value() -> String:
	return "on" if button.enabled else "off"

# gets a possible value for faults
func get_random_value() -> String:
	return ["on", "off"].pick_random()

# gets the explanation text required in the manual
func get_manual_text(value: String) -> String:
	return "Button {0} must be {1}".format([button.text, value])
