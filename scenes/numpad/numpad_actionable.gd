extends Actionable
@onready var output: Label = $"../Output"

func _ready() -> void:
	super._ready()

func get_current_value() -> String:
	return output.text
	
func get_random_value() -> String:
	return str(randi_range(1000, 9999))

func get_manual_text(value: String) -> String:
	return "Enter number: {0}".format([value])
