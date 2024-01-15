extends Actionable
@onready var output: Label = $"../Output"

func get_action_value() -> String:
	return output.text
