extends Node2D
@onready var dial_line: Sprite2D = $DialLine

# between 0 and 4
var index: int = 0

var value: String:
	get: return str(index)

func get_random_value() -> String:
	return str(randi_range(0, 4))

func _on_texture_button_pressed() -> void:
	index += 1
	if index > 4:
		index = 0
	
func _process(delta: float) -> void:
	dial_line.rotation_degrees = index * 45 - 90
	
