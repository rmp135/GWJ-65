extends Control

@onready var pause_overlay: Control = $PauseOverlay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_overlay.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		get_viewport().set_input_as_handled()
		pause_overlay.show()
