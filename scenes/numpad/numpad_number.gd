@tool
extends TextureButton
signal press

@onready var label: Label = $Label

@export var text := ""
@export var font_size := 32

func _ready() -> void:
	label.text = text
	label.label_settings.font_size = font_size

func _on_pressed() -> void:
	press.emit(label.text)

func _on_button_down() -> void:
	label.position.y += 5
	
func _on_button_up() -> void:
	label.position.y -= 5
