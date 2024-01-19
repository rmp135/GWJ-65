extends Control

@onready var seed_label: Label = %SeedLabel
@onready var quit_button: Button = %QuitButton

func _ready() -> void:
	if OS.has_feature("web"):
		quit_button.hide()
	seed_label.text = "Seed: {0}".format([GameManager.game_seed])

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


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
