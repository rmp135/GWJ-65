@tool
extends TextureButton
signal press

@onready var label: Label = $Label

@export var text: String

func _ready() -> void:
	label.text = text

func _on_pressed() -> void:
	press.emit(label.text)
