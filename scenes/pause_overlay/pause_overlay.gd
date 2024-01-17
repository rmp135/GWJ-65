extends Control

@onready var seed_label: Label = %SeedLabel

func _ready() -> void:
	seed_label.text = "Seed: {0}".format([GameManager.seed])

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and is_visible_in_tree():
		get_viewport().set_input_as_handled()
		get_tree().paused = false
		hide()

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
