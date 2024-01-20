extends Control

@onready var seed_label: Label = %SeedLabel
@onready var quit_button: Button = %QuitButton
@onready var effects_player: AudioStreamPlayer = %EffectsPlayer
@onready var alarm_player: AudioStreamPlayer = %AlarmPlayer

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
	# Cyclic reference prevents preloading.
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")


func _on_effects_slider_value_changed(value: float) -> void:
	var index = AudioServer.get_bus_index("Effects")
	AudioServer.set_bus_volume_db(index, linear_to_db(value * 2))


func _on_effects_slider_drag_ended(value_changed: bool) -> void:
	effects_player.play()


func _on_alarm_slider_value_changed(value: float) -> void:
	var index = AudioServer.get_bus_index("Alarm")
	AudioServer.set_bus_volume_db(index, linear_to_db(value * 2))


func _on_alarm_slider_drag_ended(value_changed: bool) -> void:
	alarm_player.play()
