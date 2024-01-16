extends Actionable
@onready var output: Label = $"../Output"

var r_val: String = ""

func _ready() -> void:
	r_val = str(randi_range(1000, 9999))

func get_action_value() -> String:
	return r_val
