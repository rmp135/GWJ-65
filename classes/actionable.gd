extends Node
class_name Actionable

signal action

func _ready() -> void:
	add_to_group("actionable")

func get_current_value() -> String:
	return ""
	
func get_random_value() -> String:
	return ""

# gets the explanation text required in the manual
func get_manual_text(_value: String) -> String:
	return ""
