extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	var names: Array[String] = []
	for child : ButtonLED in children:
		child.set_name_string(NameGenerator.get_name_string())
