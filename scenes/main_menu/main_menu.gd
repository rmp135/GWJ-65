extends Control

const ROOT = preload("res://scenes/root/root.tscn")
@onready var seed_input: LineEdit = %SeedInput

func _ready() -> void:
	var seed = str(randi())
	seed_input.text = seed
	GameManager.seed = seed

func _on_button_pressed() -> void:
	var seed_int = int(seed_input.text)
	seed(seed_int)
	GameManager.seed = seed_int
	get_tree().change_scene_to_packed(ROOT)
	
