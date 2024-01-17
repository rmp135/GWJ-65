extends Actionable
@onready var output: Label = $"../Output"

var action_value := ""

func _ready() -> void:
	action_value = str(randi_range(1000, 9999))

func get_action_value() -> String:
	return action_value
