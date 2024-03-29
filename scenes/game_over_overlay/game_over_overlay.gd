extends Control

@onready var seed_label: Label = %SeedLabel
@onready var quit_button: Button = %QuitButton

func _ready() -> void:
	hide()
	if OS.has_feature("web"):
		quit_button.hide()
	GameManager.game_over.connect(_on_game_over)
	seed_label.text = "Seed: {0}".format([GameManager.game_seed])

func _on_game_over():
	show()
	get_tree().paused = true	
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_main_menu_button_pressed() -> void:
	# Cyclic reference prevents preloading.
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
