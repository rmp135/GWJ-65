extends Control

const ROOT := preload("res://scenes/root/root.tscn")
@onready var seed_input: LineEdit = %SeedInput
@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	var game_seed: int = randi()
	seed_input.text = str(game_seed)
	GameManager.game_seed = game_seed
	get_tree().paused = false
	
#	var qr = QrCode.new()
#	var texture = qr.get_texture("test  string")
#	texture_rect.texture = texture
	
func _on_button_pressed() -> void:
	var seed_int: int = int(seed_input.text)
	seed(seed_int)
	GameManager.game_seed = seed_int
	get_tree().change_scene_to_packed(ROOT)
