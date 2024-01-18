extends Node2D
class_name Manual

@export var fault_manager : FaultManager
@export var sign_in_manager : SignInManager

@onready var text: Label = %Instructions
@onready var previous_button: Button = %PreviousButton
@onready var next_button: Button = %NextButton
@onready var instructions_rect: NinePatchRect = %InstructionsRect
@onready var cover_rect: NinePatchRect = %CoverRect

var page: int = 0

func _ready() -> void:
	previous_button.hide()
	cover_rect.show()
	instructions_rect.hide()
	text.text += fault_manager.get_manual()
	text.text += "\n\n"
	text.text += sign_in_manager.get_manual()
	
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
	next_button.visible = text.visible_characters != 0
