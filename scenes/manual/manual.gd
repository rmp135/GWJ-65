extends Node2D
class_name Manual

@onready var text: Label = %Instructions
@onready var previous_button: Button = %PreviousButton
@onready var instructions_rect: NinePatchRect = %InstructionsRect
@onready var cover_rect: NinePatchRect = %CoverRect

var page: int = 0

func _ready() -> void:
	previous_button.hide()
	cover_rect.show()
	instructions_rect.hide()

func _on_button_pressed() -> void:
	page = page + 1
	update_page()

func _on_previous_button_pressed() -> void:
	if page > 0:
		page = page - 1
		update_page()

func update_page() -> void:
	previous_button.visible = page != 0
	instructions_rect.visible = page != 0
	cover_rect.visible = page == 0
	
	text.lines_skipped = (page - 1) * 25

func set_instructions(instructions: String) -> void:
	text.text += instructions
