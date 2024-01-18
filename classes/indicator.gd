extends Node
class_name Indicator

func _ready() -> void:
	add_to_group("indicator")

# gets the current value for this indicator
func get_current_value() -> String:
	return ""

# gets a possible value for faults
func get_random_value() -> String:
	return ""

# gets the explanation text required in the manual
func get_manual_text(_value: String) -> String:
	return "Indicator example must be in the off position"
