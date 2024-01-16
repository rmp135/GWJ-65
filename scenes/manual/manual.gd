extends Node2D
class_name Manual

@onready var text: Label = $NinePatchRect/Text
@onready var previous_button: Button = $PreviousButton

var page: int = 1

func _on_button_pressed() -> void:
	page = page + 1
	update_page()

func _on_previous_button_pressed() -> void:
	if page > 0:
		page = page - 1
		update_page()

func update_page() -> void:
	previous_button.visible = page != 1
	text.lines_skipped = (page - 1) * 25

func set_instructions(instructions: String) -> void:
	text.text += instructions