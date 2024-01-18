extends Indicator

@onready var dial: Dial = $".."

func _ready() -> void:
	super._ready()

func get_current_value() -> String:
	return str(dial.index + 1)

# gets a possible value for faults
func get_random_value() -> String:
	return str([1,2,3,4].pick_random())

# gets the explanation text required in the manual
func get_manual_text(value: String) -> String:
	return "Dial {0} must be set to position {1}".format([dial.text, value])
