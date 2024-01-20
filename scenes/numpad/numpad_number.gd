extends TextureButton
signal press

@onready var label: Label = $Label

@export var text: String

func _ready() -> void:
	label.text = text

func _on_pressed() -> void:
	press.emit(label.text)


func _on_button_down() -> void:
	label.position.y += 5


func _on_button_up() -> void:
	label.position.y -= 5
