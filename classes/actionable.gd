extends Node
class_name Actionable

signal action

func _ready() -> void:
	add_to_group("actionable")

func get_action_value() -> String:
	return ""
