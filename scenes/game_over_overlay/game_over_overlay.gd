extends Control

@onready var seed_label: Label = %SeedLabel

func _ready() -> void:
	hide()
	GameManager.game_over.connect(_on_game_over)
	#seed_label.text = "Seed: {0}".format([GameManager.game_seed])

func _on_game_over():
	show()
	get_tree().paused = true	
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
